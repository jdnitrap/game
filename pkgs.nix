# pkgs.nix
{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  # GameMode
  programs.gamemode.enable = true;

  # Gamescope (frame pacing, HDR, nested sessions)
  programs.gamescope.enable = true;

  environment.systemPackages = with pkgs; [
    steam
    lutris
    heroic
    wine
    mangohud
    protonup-qt
    proton-ge-bin
    gamescope
    atlauncher
    prismlauncher
    hmcl
    protonvpn-gui
    git
    bottles
  ];
}
