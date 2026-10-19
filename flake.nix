{
  description = "NixOS gaming setup (hybrid Intel + NVIDIA RTX 5050 Laptop)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.gaming = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
