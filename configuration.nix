# configuration.nix
# Flake-based NixOS gaming + AI host

{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./video.nix
    ./specialboot.nix          # battery-saver specialisation
    ./sound.nix
    ./autoupdate.nix
    ./boot.nix
    ./firewall.nix
    ./game_controller.nix
    ./networking.nix
    ./pkgs.nix
    ./plasma.nix
    ./steam.nix
    ./system.nix
    ./users.nix
    ./laptop.nix
    ./system_state_version.nix
    ./experimental-features.nix
    ./exclude_stuff_from_system.nix
    ./bluetooth.nix
    ./gc.nix
    ./ai.nix
  ];
}
