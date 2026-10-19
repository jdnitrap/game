# bluetooth.nix
# Configured with Microsoft / Xbox Bluetooth controllers in mind (uses xpadneo)
{ config, lib, pkgs, ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Helps with pairing Xbox / Microsoft Bluetooth controllers
        JustWorksRepairing = "always";
        FastConnectable = "true";
        Privacy = "device";
        Class = "0x000100";
      };
    };
  };

  # Optional GUI for managing Bluetooth devices
  services.blueman.enable = true;
}
