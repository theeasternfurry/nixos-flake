{ pkgs, system, ... }:

{
  users.users = {
    thevalleyman = {
      isNormalUser = true;
      description = "thevalleyman";
      extraGroups = [
        "audio"
        "input"
        "libvirtd"
        "networkmanager"
        "video"
      ];
      packages = with pkgs;  [
        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        firefox

        # Tools
        alacritty-graphics   # Terminal
        bottom               # terminal system tool
        fuzzel               # Menu
        helix                # Terminal text editor
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        swww                 # Image
        xfce.thunar          # File manager
        waybar
        xwayland-satellite
      ];
    };
  };
}
