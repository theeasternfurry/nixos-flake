{ outputs, veloren, pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      auto-optimise-store = true;
      max-jobs = 1;
    };
    registry.veloren.flake = veloren;
  };
  nixpkgs = {
    overlays = [
      outputs.overlays.amd-pc-packages
      outputs.overlays.custom-packages
    ];
    config = {
      allowUnfree = true;
    };
  };
}
