[CmdletBinding(SupportsShouldProcess)]
param()

$ErrorActionPreference = "Stop"

if ($PSCmdlet.ShouldProcess("DNS cache", "Flush")) {
    ipconfig /flushdns | Out-Null
    Write-Host "DNS cache flushed." -ForegroundColor Green
}

if ($PSCmdlet.ShouldProcess("TCP autotuning", "Set to normal")) {
    netsh int tcp set global autotuninglevel=normal | Out-Null
    Write-Host "TCP autotuning set to normal." -ForegroundColor Green
}

if ($PSCmdlet.ShouldProcess("TCP RSS", "Enable")) {
    netsh int tcp set global rss=enabled | Out-Null
    Write-Host "TCP RSS enabled." -ForegroundColor Green
}

Write-Host "Network refresh complete. A reboot is not required." -ForegroundColor DarkGray
