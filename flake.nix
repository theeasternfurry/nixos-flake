{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixvim = {
      url = "github:goatastronaut0212/nixvim-flake-config";
    };

    niri = {
      url = "github:YaLTeR/niri";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    niri
  }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
    in {
      overlays = import ./overlays;

      nixosConfigurations = {
        nixos-dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix
          ];
        };
      };
    };
}
