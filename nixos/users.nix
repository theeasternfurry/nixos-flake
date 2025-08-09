{  pkgs, inputs, system, ... }:

{
  users.users = {
    theeasternfurry = {
      isNormalUser = true;
      description = "theeasternfurry";
      extraGroups = [
        "audio"
        "docker"
        "input"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
      ];
      packages = with pkgs;  [
        # Development
        bruno
        dbeaver-bin
        drawio
        obs-studio
        krita
        gnome-disk-utility

        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        brave
        firefox
        element-desktop

        # Tools
        alacritty-graphics   # Terminal
        bluetuith            # Terminal bluetooth tool
        bottom               # terminal system tool
        cmus                 # Music player terminal
        fastfetch            # Fetch system tools
        fuzzel               # Menu
        gparted
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        swww                 # Image
        termusic             # Terminal Rust music player
        xfce.thunar          # File manager
        waybar
        xwayland-satellite
        yazi

        code-cursor-fhs
        protonvpn-gui
        legcord
      ] ++ [
        inputs.nixvim.packages."${system}".default
      ];
    };
  };
}
