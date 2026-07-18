{
  description = "Dorg NixOS flake config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # disko - Declarative disk partitioning
    # lanzaboote - nixos secureboot
    # sops-nix - nix secret provisioning
    # nixos-anywhere - remote unsupervised nixos installation
  };

  outputs = { self, nixPkgs, ... }: {
    nixosConfigurations.dorg = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };
  };
}
