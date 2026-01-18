# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./video.nix
      #./specialboot.nix
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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bob = {
    isNormalUser = true;
    description = "bob";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
    packages = with pkgs; [
    
    ];
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
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






