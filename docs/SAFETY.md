# Safety

Pulse is deliberately small. The goal is a readable maintenance toolkit, not a system-wide "optimizer".

## What Pulse does not do

- No registry debloat.
- No service removal.
- No driver changes.
- No scheduled tasks.
- No background agent.
- No telemetry or uploads.

## Reversible changes

- **Power plan** - switch back with `scripts\Restore-Balanced.ps1` or Windows Settings.
- **Temp cleanup** - only removes files older than the cutoff. Use `-WhatIf` to preview.
- **Network refresh** - flushes DNS and resets TCP autotuning/RSS to Windows defaults. No Winsock reset, no reboot required.
- **Game priority** - applies to the current process only; closing the game resets it.

## Before running

1. Read the script you are about to run.
2. Create a restore point if you are experimenting with system settings.
3. Run PowerShell as administrator.
4. Prefer `-WhatIf` for cleanup and network changes.

## Reporting

Open an issue with the script name, Windows version, the command you ran, and the complete error output. Do not include personal data or full system logs.
