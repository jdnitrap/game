# experimental-features.nix
{ config, lib, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
