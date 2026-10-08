{
  description = "Homeserver NixOS flake config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    # disko - Declarative disk partitioning
    # lanzaboote - nixos secureboot
    # sops-nix - nix secret provisioning
    # nixos-anywhere - remote unsupervised nixos installation
  };

  outputs = { self, nixpkgs }@inputs:
  let
    lib = nixpkgs.lib;
    username = "admin";
    sharedModules = ./modules
      |> lib.filesystem.listFilesRecursive
      |> lib.filter (lib.hasSuffix ".nix");
    mkSystem = hostname: lib.nixosSystem {
      specialArgs = {
        inherit self inputs username hostname;
#        pkgs-unstable = import nixpkgs-unstable {
#          system = "x86_64-linux";
#          config.allowUnfree = true;
#        };
      };
      modules = [ ./hosts/${hostname} ] ++ sharedModules;
    };
  in {
    nixosConfigurations =
      lib.genAttrs
        (lib.readDir ./hosts
          |> lib.filterAttrs (n: t: t == "directory")
          |> lib.attrNames)
        mkSystem;
    
#    packages =
#      lib.genAttrs [ "x86_64-linux" ] (system: ./packages
#        |> lib.filesystem.listFilesRecursive
#        |> lib.filter (lib.hasSuffix ".nix")
#        |> map (p: nixpkgs.legacyPackages.${system}.callPackage p {})
#        |> map (p: { name = p.pname or p.name; value = p;})
#        |> lib.listToAttrs);
  };
}
