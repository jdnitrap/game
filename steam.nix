##steam.nix

{ config, lib, pkgs, ... }:
{
  programs.steam = {
    enable = true;

    # Gamescope session for Big Picture / Deck-style mode
    gamescopeSession.enable = true;

    # Keep ports open for streaming / Remote Play
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
}
