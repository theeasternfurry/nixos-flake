{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development
    nix-du
    musescore

    unstable.bruno

    # Internet
    unstable.microsoft-edge

    # Language Server
    nixd
    lua-language-server

    # Media player
    obs-studio

    # Iconspack
    papirus-icon-theme

    # Terminal system Tool
    acpid        # A daemon for delivering ACPI events to userspace programs
    cage
    feh          # Image viewer

    # Graphical system tool
    copyq # clipboard manager
    flameshot # take screen shot
    kid3        # Audio tagger
  ];
}
