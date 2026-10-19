# users.nix
{ config, lib, pkgs, ... }:
{
  users.users.admin = {
    isNormalUser = true;
    description = "Admin";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "gamemode" "bluetooth" ];
    initialPassword = "changeme";  # change immediately after first login
  };

  users.users.user1 = {
    isNormalUser = true;
    description = "User 1";
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" "gamemode" "bluetooth" ];
    initialPassword = "changeme";  # change immediately after first login
  };

  # Allow members of wheel to use sudo
  security.sudo.wheelNeedsPassword = true;
}
