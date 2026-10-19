# game

NixOS gaming setup (hybrid Intel + NVIDIA RTX 5050 Laptop).

## Usage

1. Generate `hardware-configuration.nix` on the target machine (`nixos-generate-config`).
2. Place these files in `/etc/nixos/` (or your flake’s host directory).
3. `sudo nixos-rebuild switch`

## Notes

- PRIME offload is enabled by default (`nvidia-offload` command available).
- GameMode is enabled (`gamemoderun %command%` in Steam).
- Xbox controllers: `hardware.xone` + `hardware.xpadneo`.
