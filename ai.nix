# ai.nix
# Local AI on the RTX 5050 — both ready-to-run tools and building your own
{ config, lib, pkgs, ... }:
{
  # CUDA support (needed for GPU-accelerated frameworks)
  hardware.nvidia.cudaSupport = true;

  environment.systemPackages = with pkgs; [
    # ---- Ready-to-run ----
    ollama
    llama-cpp

    # ---- Learning & building your own ----
    (python3.withPackages (ps: with ps; [
      # Core scientific
      numpy
      scipy
      pandas
      matplotlib

      # Deep learning
      torch
      torchvision
      torchaudio

      # Transformers / fine-tuning / datasets
      transformers
      accelerate
      peft
      bitsandbytes
      datasets
      tokenizers
      safetensors
      huggingface-hub
      sentencepiece

      # Classic ML + utilities
      scikit-learn
      pillow
      opencv4
      tqdm
      einops

      # Notebooks
      jupyter
      jupyterlab
      ipython
      ipykernel
    ]))

    # Monitoring and general tools
    nvtop
    btop
    htop
    git
    wget
    curl
    rsync
    tmux

    # GUI helpers for the gpu-run script
    kdePackages.kdialog
  ];

  # Simple picker so you don't have to type nvidia-offload every time
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "gpu-run" (builtins.readFile ./gpu-run))
  ] ++ (with pkgs; [
    ollama
    llama-cpp
    nvtop
    btop
    htop
    git
    wget
    curl
    rsync
    tmux
    kdePackages.kdialog
  ]);

  # Optional: run Ollama as a system service
  # services.ollama.enable = true;
  # services.ollama.acceleration = "cuda";
}
