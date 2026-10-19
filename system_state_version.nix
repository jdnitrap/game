# system_state_version.nix
{ config, lib, pkgs, ... }:
{
  # Set to the release you first installed (or a recent one when migrating).
  # Using a concrete version is safer than "master".
  system.stateVersion = "25.11";
}
