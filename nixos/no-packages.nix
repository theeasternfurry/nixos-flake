{ pkgs, ... }:

{
  programs.nano.enable = false;
  services.xserver.excludePackages = with pkgs; [
    gnome-console
    gnome-tour
    xterm
  ];
}
