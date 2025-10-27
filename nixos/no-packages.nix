{ pkgs, ... }:

{
  documentation = {
    man.enable = true;
    nixos.enable = false;
  };
  programs.nano.enable = false;
  services.xserver.excludePackages = with pkgs; [
    gnome-console
    gnome-tour
    xterm
  ];
}
