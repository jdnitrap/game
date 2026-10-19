# specialboot.nix
# Battery-saver specialisation: disables NVIDIA offload/power management
# so the system can run on the Intel iGPU only.
{ config, lib, pkgs, ... }:
{
  specialisation = {
    battery-saver.configuration = {
      system.nixos.tags = [ "battery-saver" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        prime.offload.enableOffloadCmd = lib.mkForce false;
        powerManagement.enable = lib.mkForce false;
        powerManagement.finegrained = lib.mkForce false;
      };
    };
  };
}
