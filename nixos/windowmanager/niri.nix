{ inputs, system, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${system}.default;
  };
}
