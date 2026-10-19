##plasma.nix

{ config, lib, pkgs, ... }:
{
  # Enable the Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable the X11 windowing system (fallback session remains available).
  services.xserver.enable = true;

  # Prefer Wayland by default at the login screen
  services.displayManager.defaultSession = "plasma";
}
