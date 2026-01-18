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
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

# Enable the Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  



  

 

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  
  steam
  lutris
  heroic
  wine
  linuxKernel.packages.linux_xanmod_latest.xone
  linuxKernel.packages.linux_xanmod_latest.xpadneo
  mangohud
   protonup-qt 
   linuxKernel.packages.linux_zen.xone
	linuxKernel.packages.linux_zen.xpadneo
	linuxKernel.packages.linux_xanmod_stable.xpadneo
	atlauncher
	badlion-client
	prismlauncher
	lunar-client
	hmcl
	protonvpn-gui
	#xone
	#xpadneo
	git
	bottles
   
  ];



  



  
   networking.firewall.enable = true;

 
  system.stateVersion = "master"; #d you read the comment?
  








hardware.bluetooth.enable = true;
#hardware.bluetooth.settings = {
 # General = {
#    FastConnectable = true;
#  };
#};
#services.blueman.enable = true;
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

#hardware.xone.enable = true;
#hardware.xpadneo.enable = true;

nixpkgs.config.allowUnfree = true;

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};

nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
  

#services.xserver.excludePackages = with  pkgs; [ xterm ];
documentation.nixos.enable = false;


##Update

system.autoUpgrade = {
  enable = true;
  allowReboot = false;  # Allows automatic reboot if necessary
  dates = "02:00";     # Schedule updates at 2 AM
  randomizedDelaySec = "45min";  # Random delay to avoid simultaneous updates
};





 # hardware.graphics.enable = true;
 #services.xserver.videoDrivers = [ "nvidia"];
 #hardware.nivida = {
  #enable = true;
  #open = true;
  #modesetting.enable = true;
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
  #  nvidiaSettings = true;
    #powerManagement.enable = false;
    #powerManagement.finegrained = false;
   # };




    # For offloading, `modesetting` is needed additionally,
  # otherwise the X-server will be running permanently on nvidia,
  # thus keeping the GPU always on (see `nvidia-smi`).
  #services.xserver.videoDrivers = [
   # "modesetting"  # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
    #"nvidia"
  #];

  hardware.nvidia.prime = {
  #  offload = {
   #    enable = true;
    #   enableOffloadCmd = true;
     #  };
#

   intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    #amdgpuBusId = "PCI:54:0:0"; # If you have an AMD iGPU
 };



nix.settings.experimental-features = [ "nix-command"];





}






