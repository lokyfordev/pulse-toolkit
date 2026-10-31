[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [string]$Name
)

$ErrorActionPreference = "Stop"
$process = Get-Process -Name $Name -ErrorAction SilentlyContinue | Select-Object -First 1

if (-not $process) {
    Write-Warning "Process '$Name' is not running."
    return
}

if ($PSCmdlet.ShouldProcess("$($process.ProcessName) ($($process.Id))", "Set priority to High")) {
    try {
        $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::High
        Write-Host "Priority set to High for $($process.ProcessName) ($($process.Id))." -ForegroundColor Green
    } catch {
        Write-Warning "Could not change priority: $($_.Exception.Message)"
    }
}
