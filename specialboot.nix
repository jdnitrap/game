#specialboot.nix


{ config, lib, pkgs, ... }:
{
specialisation = {
  on-the-go.configuration = {
    system.nixos.tags = [ "on-the-go" ];
    hardware.nvidia = {
      prime.offload.enable = lib.mkForce false;
      prime.offload.enableOffloadCmd = lib.mkForce false;
      prime.sync.enable = lib.mkForce true;
    };
  };
};

}
