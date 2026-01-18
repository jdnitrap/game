# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./video.nix
#    ./specialboot.nix
	./sound.nix
	./autoupdate.nix
	./boot.nix
	./firewall.nix
	./game_controller.nix
	./networking.nix
	./pkgs.nix
	./plasma.nix
	./sound.ni
	./steam.nix
	./system.nix
	./system_state_version.nix
	./video.nix
	./expermental_features.nix
	./exclude_stuff_from_system.nix
	./bluetooth.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  



  



  

 






  



  
 

 
  
  










#hardware.xone.enable = true;
#hardware.xpadneo.enable = true;



}






