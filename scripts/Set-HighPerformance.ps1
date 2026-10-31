[CmdletBinding(SupportsShouldProcess)]
param()

$ErrorActionPreference = "Stop"

if ($PSCmdlet.ShouldProcess("Power plan", "Switch to High performance")) {
    powercfg /setactive SCHEME_MIN | Out-Null
    $active = (powercfg /getactivescheme) -join " "
    Write-Host "Active power plan: $active" -ForegroundColor Green
}
