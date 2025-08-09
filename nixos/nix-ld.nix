{ pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib   # numpy
    libgcc # sqlalchemy
  ];
}
