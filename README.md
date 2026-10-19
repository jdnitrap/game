# game

NixOS gaming flake (hybrid Intel + NVIDIA RTX 5050 Laptop).

Tracks **nixpkgs master**.

## Users

- `nimda` — admin (wheel)
- `user1` — regular user

Both start with password `changeme`. Change them immediately after first login (`passwd`).

## Usage

1. Generate `hardware-configuration.nix` on the target machine:
   ```bash
   nixos-generate-config --root /
   ```
   (or copy your existing one into this directory).

2. Rebuild:
   ```bash
   sudo nixos-rebuild switch --flake .#gaming
   ```

## Features

- PRIME offload for the RTX 5050 (`nvidia-offload`)
- Steam, Lutris, Heroic, GameMode, Gamescope, MangoHud
- Xbox / Microsoft Bluetooth controllers (`hardware.xone` + `hardware.xpadneo`)
- Laptop power management (`power-profiles-daemon`, lid suspend on battery)
- PipeWire, Plasma 6, SDDM

## Notes

- Bluetooth is tuned for Microsoft / Xbox controllers (JustWorksRepairing=always).
- Battery-saver specialisation is available in `specialboot.nix` (currently commented out).
