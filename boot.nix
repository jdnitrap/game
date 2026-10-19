##boot.nix

{ config, lib, pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Latest kernel. If you hit NVIDIA suspend or module-load issues on the RTX 5050,
  # switch to a more conservative kernel, e.g.:
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # or
  # boot.kernelPackages = pkgs.linuxPackages_lts;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
