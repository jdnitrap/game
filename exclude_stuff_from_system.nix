##exclude_stuff_from_system.nix

{ config, lib, pkgs, ... }:
{
#services.xserver.excludePackages = with  pkgs; [ xterm ];
documentation.nixos.enable = false;
}
