##pkgs.nix
{ config, lib, pkgs, ... }:
{

nixpkgs.config.allowUnfree = true;


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
}
