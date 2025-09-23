{ pkgs, system, inputs, ... }:

let
  termusic = pkgs.callPackage ../../../pkgs/termusic.nix {};
in
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
        "wireshark"
      ];
      packages = with pkgs;  [
        # Development
        bruno
        dbeaver-bin
        devenv
        drawio
        godot
        obs-studio
        krita
        gnome-disk-utility
        wireshark

        # Games
        cataclysm-dda-git

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
        joplin-desktop
        helix                # Terminal text editor
        kid3                 # Music tagger
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        quickgui
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
      ] ++ [
        inputs.noctalia.packages.${system}.default
        inputs.quickshell.packages.${system}.default
      ];
    };
  };
}
