# specialboot.nix
{ config, lib, pkgs, ... }:
{
  specialisation = {
    battery-saver.configuration = {
      system.nixos.tags = [ "battery-saver" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce false;
        powerManagement.enable = lib.mkForce false;
        # Leave the iGPU only
      };
      # Optionally disable the NVIDIA driver entirely here if desired
    };
  };
}
