# Contributing

## Rules

- Keep changes small and reversible.
- No registry debloat, service removal, driver changes or background agents.
- Support `-WhatIf` for scripts that change the system.
- Document the rollback path in the script or in `docs/SAFETY.md`.
- Test on Windows 10 and Windows 11 where possible.

## Pull request checklist

- [ ] The script parses without errors.
- [ ] The change is documented in `docs/SCRIPTS.md`.
- [ ] The rollback path is clear.
- [ ] No personal data, logs or machine-specific paths are committed.
- [ ] The README still matches the actual behavior.

## Style

- Approved verbs (`Get-`, `Set-`, `Clean-`, `Restore-`).
- `[CmdletBinding()]` and `SupportsShouldProcess` where it applies.
- Clear `Write-Host` / `Write-Warning` messages.
- No aliases in scripts.
