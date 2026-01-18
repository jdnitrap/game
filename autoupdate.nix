##Auto Update
{ config, lib, pkgs, ... }:
{
system.autoUpgrade = {
  enable = true;
  allowReboot = false;  # Allows automatic reboot if necessary
  dates = "02:00";     # Schedule updates at 2 AM
  randomizedDelaySec = "45min";  # Random delay to avoid simultaneous updates
};
}
