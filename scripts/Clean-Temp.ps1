[CmdletBinding(SupportsShouldProcess)]
param(
    [int]$Days = 1
)

$ErrorActionPreference = "Stop"
$cutoff = (Get-Date).AddDays(-$Days)
$paths = @($env:TEMP, (Join-Path $env:WINDIR "Temp"))
$removed = 0
$freed = 0

foreach ($path in $paths) {
    if (-not (Test-Path $path)) { continue }

    $items = @(Get-ChildItem -Path $path -Force -ErrorAction SilentlyContinue |
        Where-Object { $_.LastWriteTime -lt $cutoff })

    foreach ($item in $items) {
        $size = 0
        if ($item.PSIsContainer) {
            $size = (Get-ChildItem $item.FullName -Recurse -File -ErrorAction SilentlyContinue |
                Measure-Object Length -Sum).Sum
        } else {
            $size = $item.Length
        }

        if ($PSCmdlet.ShouldProcess($item.FullName, "Remove old temp item")) {
            try {
                Remove-Item $item.FullName -Recurse -Force -ErrorAction Stop
                $removed++
                $freed += [int64]$size
            } catch {
                Write-Warning "Skipped: $($item.FullName) - $($_.Exception.Message)"
            }
        }
    }
}

$mb = [math]::Round($freed / 1MB, 1)
Write-Host "Removed $removed item(s), freed about $mb MB." -ForegroundColor Green
