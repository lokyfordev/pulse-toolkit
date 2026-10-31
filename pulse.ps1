#requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Show-Menu {
    Clear-Host
    Write-Host "PULSE TOOLKIT 1.0.0" -ForegroundColor White
    Write-Host ""
    Write-Host "[1] Clean temporary files" -ForegroundColor DarkYellow
    Write-Host "[2] High performance power plan" -ForegroundColor DarkYellow
    Write-Host "[3] Network refresh" -ForegroundColor DarkYellow
    Write-Host "[4] System report" -ForegroundColor DarkYellow
    Write-Host "[5] Set game priority" -ForegroundColor DarkYellow
    Write-Host "[6] Restore balanced power plan" -ForegroundColor DarkYellow
    Write-Host "[Q] Quit" -ForegroundColor DarkGray
    Write-Host ""
}

$quit = $false
while (-not $quit) {
    Show-Menu
    $choice = Read-Host "Select an option"

    switch ($choice.ToLowerInvariant()) {
        "1" { & (Join-Path $root "scripts\Clean-Temp.ps1") }
        "2" { & (Join-Path $root "scripts\Set-HighPerformance.ps1") }
        "3" { & (Join-Path $root "scripts\Optimize-Network.ps1") }
        "4" { & (Join-Path $root "scripts\Check-System.ps1") }
        "5" {
            $name = Read-Host "Process name (for example cs2)"
            & (Join-Path $root "scripts\Set-GamePriority.ps1") -Name $name
        }
        "6" { & (Join-Path $root "scripts\Restore-Balanced.ps1") }
        "q" { $quit = $true; continue }
        default { Write-Host "Unknown option." -ForegroundColor Red }
    }

    if (-not $quit) {
        Write-Host ""
        Read-Host "Press Enter to return to the menu" | Out-Null
    }
}
