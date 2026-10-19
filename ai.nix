# ai.nix
# Local AI / ML experimentation on the RTX 5050
{ config, lib, pkgs, ... }:
{
  # CUDA support (needed for GPU-accelerated frameworks)
  hardware.nvidia.cudaSupport = true;

  environment.systemPackages = with pkgs; [
    # Local LLM runner
    ollama

    # Python + common ML stack (CUDA builds)
    (python3.withPackages (ps: with ps; [
      numpy
      torch
      torchvision
      transformers
      accelerate
      sentencepiece
      huggingface-hub
      jupyter
      ipython
    ]))

    # Useful tools
    nvtop
    btop
    git
    wget
    curl
  ];

  # Optional: run Ollama as a system service (uncomment if you want it always available)
  # services.ollama.enable = true;
  # services.ollama.acceleration = "cuda";
}
