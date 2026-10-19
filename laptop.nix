# laptop.nix
# Power and laptop-specific tweaks for the hybrid ZenBook-class machine
{ config, lib, pkgs, ... }:
{
  # Modern power management (replaces TLP for most users)
  services.power-profiles-daemon.enable = true;

  # Firmware updates
  services.fwupd.enable = true;

  # Trim SSDs
  services.fstrim.enable = true;

  # Lid / suspend behavior
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "ignore";  # stay awake when docked / on power
    lidSwitchDocked = "ignore";
  };

  # No hibernate by default (can be enabled later if swap is set up)
  # systemd.sleep.extraConfig = ''
  #   HibernateMode=shutdown
  # '';
}
