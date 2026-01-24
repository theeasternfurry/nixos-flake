{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-nvim = {
      url = "github:theeasternfurry/nix-nvim";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    veloren = {
      url = "gitlab:veloren/veloren?ref=weekly";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-nvim,
      quickshell,
      noctalia,
      sops-nix,
      veloren,
    }@inputs:
    let
      inherit (self) outputs;

      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;

      overlays = import ./overlays;

      nixosConfigurations = {
        amd-pc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system veloren; };

          modules = [
            ./nixos/hardware/amd-pc/config.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.theeasternfurry = ./home/home.nix;
            }
            sops-nix.nixosModules.sops
          ];
        };

        dell-vostro-intel = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            ./nixos/hardware/dell-vostro-intel/config.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.theeasternfurry = ./home/home.nix;
            }
            sops-nix.nixosModules.sops
          ];
        };
      };
    };
}
