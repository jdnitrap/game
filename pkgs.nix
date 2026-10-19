# pkgs.nix
{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  # GameMode
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steam
    lutris
    heroic
    wine
    mangohud
    protonup-qt
    atlauncher
    prismlauncher
    hmcl
    protonvpn-gui
    git
    bottles
  ];
}
