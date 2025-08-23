{ pkgs, system, ... }:

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
        godot
        obs-studio
        krita
        gnome-disk-utility

        # Games
        prismlauncher

        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        firefox
        element-desktop

        # Tools
        alacritty-graphics   # Terminal
        bottom               # terminal system tool
        cmus                 # Music player terminal
        fastfetch            # Fetch system tools
        fuzzel               # Menu
        helix                # Terminal text editor
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        swww                 # Image
        termusic             # Terminal Rust music player
        xfce.thunar          # File manager
        waybar
        xwayland-satellite
        yazi
        zellij               # Window multipletex

        code-cursor-fhs
        protonvpn-gui
        legcord
      ];
    };
  };
}
