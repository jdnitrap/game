# game

NixOS gaming + AI flake (hybrid Intel + NVIDIA RTX 5050 Laptop).

Tracks **nixpkgs master**.

## Users

- `admin` — admin (wheel)
- `user1` — admin (wheel)

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
- Steam, Lutris, Heroic, GameMode, Gamescope, MangoHud, Proton-GE
- Steam gamescope session
- Xbox / Microsoft Bluetooth controllers (`hardware.xone` + `hardware.xpadneo`)
- Laptop power management (`power-profiles-daemon`, lid suspend on battery)
- PipeWire, Plasma 6 (Wayland default), SDDM
- Battery-saver specialisation
- Local AI stack: CUDA, Ollama, PyTorch (CUDA), Transformers, Jupyter

## Notes

- Bluetooth is tuned for Microsoft / Xbox controllers (JustWorksRepairing=always).
- To use the battery-saver specialisation: `sudo nixos-rebuild switch --flake .#gaming --specialisation battery-saver` (or select it at the boot menu after a rebuild).
- For GPU-accelerated AI work, run commands under `nvidia-offload` (e.g. `nvidia-offload ollama serve` or `nvidia-offload jupyter notebook`).
