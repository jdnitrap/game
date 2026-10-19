# game_controller.nix
{ config, lib, pkgs, ... }:
{
  # Xbox One / Series controllers (wired or with the official dongle)
  hardware.xone.enable = true;

  # Xbox One / Series controllers over Bluetooth
  hardware.xpadneo.enable = true;
}
