[CmdletBinding(SupportsShouldProcess)]
param()

$ErrorActionPreference = "Stop"

if ($PSCmdlet.ShouldProcess("Power plan", "Restore Balanced")) {
    powercfg /setactive SCHEME_BALANCED | Out-Null
    $active = (powercfg /getactivescheme) -join " "
    Write-Host "Active power plan: $active" -ForegroundColor Green
}
