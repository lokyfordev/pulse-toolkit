[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

Write-Host "PULSE SYSTEM REPORT" -ForegroundColor White
Write-Host ""

$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$ram = Get-CimInstance Win32_PhysicalMemory |
    Measure-Object -Property Capacity -Sum
$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
$system = Get-CimInstance Win32_ComputerSystem
$os = Get-CimInstance Win32_OperatingSystem
$disk = Get-PSDrive -Name C -ErrorAction SilentlyContinue

Write-Host ("CPU      {0}" -f $cpu.Name.Trim())
Write-Host ("Cores    {0} physical / {1} logical" -f $cpu.NumberOfCores, $cpu.NumberOfLogicalProcessors)
Write-Host ("RAM      {0:N1} GB" -f ($ram.Sum / 1GB))
Write-Host ("GPU      {0}" -f $gpu.Name)
Write-Host ("System   {0} {1}" -f $system.Manufacturer, $system.Model)
Write-Host ("OS       {0} (build {1})" -f $os.Caption, $os.BuildNumber)
if ($disk) {
    Write-Host ("Disk C:  {0:N1} GB free / {1:N1} GB" -f ($disk.Free / 1GB), (($disk.Used + $disk.Free) / 1GB))
}

Write-Host ""
Write-Host "Report complete. Nothing was changed." -ForegroundColor Green
