##expermental_features.nix
{ config, lib, pkgs, ... }:
{


nix.settings.experimental-features = [ "nix-command" "nix" "flakes"];
}
