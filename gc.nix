# gc.nix
# Weekly automatic garbage collection
{ config, lib, pkgs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
