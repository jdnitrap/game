##bluetooth.nix

{ config, lib, pkgs, ... }:
{


hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true; # powers up the default Bluetooth controller on boot
    settings = {
      General = {
        Privacy = "device";
        JustWorksRepairing = "always";
        Class = "0x000100";
        FastConnectable = "true";
      };
    };

hardware.bluetooth.enable = true;
#hardware.bluetooth.settings = {
 # General = {
#    FastConnectable = true;
#  };
#};
#services.blueman.enable = true;
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };
}
