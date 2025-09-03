{ pkgs, system, ... }:

{
  users.users = {
    theeasternfurry = {
      isNormalUser = true;
      description = "theeasternfurry";
      extraGroups = [
        "audio"
        "cups"
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
        microsoft-edge

        # Tools
        alacritty-graphics   # Terminal
        bottom               # terminal system tool
        cmus                 # Music player terminal
        fastfetch            # Fetch system tools
        fuzzel               # Menu
        helix                # Terminal text editor
        kid3                 # Music tagger
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        quickshell           # Quickshell
        swww                 # Image
        termusic             # Terminal Rust music player
        xfce.thunar          # File manager
        vlc
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
