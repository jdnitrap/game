# video.nix
# Hybrid Intel Raptor Lake-S UHD + NVIDIA RTX 5050 Laptop (Blackwell)

{ config, lib, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;   # needed for Steam/Proton/Wine
  };

  # modesetting for the Intel iGPU + nvidia for the dGPU
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    # Save/restore VRAM on suspend (helps avoid corruption after wake)
    powerManagement.enable = true;

    # Fine-grained power management (safe on Turing and newer, including Blackwell)
    powerManagement.finegrained = true;

    # Blackwell supports the open kernel modules
    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      # Offload so the RTX 5050 stays asleep until needed
      offload.enable = true;
      offload.enableOffloadCmd = true;   # provides the `nvidia-offload` command

      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}
