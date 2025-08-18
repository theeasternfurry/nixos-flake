{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    niri = {
      url = "github:YaLTeR/niri";
    };
  };

  outputs = {
    self,
    nixpkgs,
    niri
  }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      
      # Apply overlays to nixpkgs
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ outputs.overlays.custom-packages ];
      };
    in {
      overlays = import ./overlays;

      packages.${system} = {
        fcitx5 = pkgs.fcitx5;
        fcitx5-unikey = pkgs.fcitx5-unikey;
      };

      nixosConfigurations = {
        amd-pc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            ./nixos/hardware/amd-pc/config.nix
          ];
        };

        dell-vostro-intel = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            ./nixos/hardware/dell-vostro-intel/config.nix
          ];
        };
      };
    };
}
