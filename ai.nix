# ai.nix
# Local AI / ML experimentation on the RTX 5050
{ config, lib, pkgs, ... }:
{
  # CUDA support (needed for GPU-accelerated frameworks)
  hardware.nvidia.cudaSupport = true;

  environment.systemPackages = with pkgs; [
    # Local LLM runners
    ollama
    llama-cpp

    # Python + common ML / AI stack (CUDA builds where available)
    (python3.withPackages (ps: with ps; [
      numpy
      scipy
      pandas
      matplotlib
      torch
      torchvision
      torchaudio
      transformers
      accelerate
      sentencepiece
      huggingface-hub
      datasets
      tokenizers
      safetensors
      jupyter
      jupyterlab
      ipython
      ipykernel
      pillow
      opencv4
      scikit-learn
      tqdm
      einops
      peft
      bitsandbytes
    ]))

    # Image / diffusion related helpers
    # (full ComfyUI / Automatic1111 are usually run from their own clones)

    # Useful monitoring and tools
    nvtop
    btop
    git
    wget
    curl
    rsync
    tmux
    htop
  ];

  # Optional: run Ollama as a system service (uncomment if you want it always available)
  # services.ollama.enable = true;
  # services.ollama.acceleration = "cuda";
}
