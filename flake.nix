{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nix-nvim = {
      url = "github:theeasternfurry/nix-nvim";
    };

    niri = {
      url = "github:YaLTeR/niri";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nix-nvim,
    niri,
    quickshell,
    noctalia
  }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";
      
      # Apply overlays to nixpkgs
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ outputs.overlays.custom-packages nix-nvim.overlays.default ];
      };
    in {
      overlays = import ./overlays;

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
