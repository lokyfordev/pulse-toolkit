# Scripts

## `pulse.ps1`

The menu. It does not change anything by itself; it calls the scripts below.

## `Clean-Temp.ps1`

Removes items older than `-Days` (default `1`) from `%TEMP%` and `%WINDIR%\Temp`.

```powershell
.\scripts\Clean-Temp.ps1 -WhatIf
.\scripts\Clean-Temp.ps1 -Days 7
```

## `Set-HighPerformance.ps1`

Switches to the Windows High performance power plan.

```powershell
.\scripts\Set-HighPerformance.ps1
```

## `Optimize-Network.ps1`

Flushes the DNS cache and sets TCP autotuning/RSS to normal Windows values.

```powershell
.\scripts\Optimize-Network.ps1 -WhatIf
.\scripts\Optimize-Network.ps1
```

## `Check-System.ps1`

Prints CPU, RAM, GPU, system, OS and C: disk information. Read-only.

```powershell
.\scripts\Check-System.ps1
```

## `Set-GamePriority.ps1`

Sets a running process to High priority.

```powershell
.\scripts\Set-GamePriority.ps1 -Name cs2
.\scripts\Set-GamePriority.ps1 -Name RobloxPlayerBeta
```

## `Restore-Balanced.ps1`

Restores the Balanced power plan.

```powershell
.\scripts\Restore-Balanced.ps1
```
