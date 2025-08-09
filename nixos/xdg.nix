{ pkgs, ... }:

{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    config.common.default = [ "gtk" "gnome" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
