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
        libreoffice
        obs-studio
        krita
        gnome-disk-utility
        quickgui
        wireshark
        zed-editor-fhs

        # Games
        cataclysm-dda-git
        prismlauncher

        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        firefox
        element-desktop
        microsoft-edge
        protonvpn-gui

        # Tools
        bottom               # terminal system tool
        fastfetch            # Fetch system tools
        joplin-desktop
        kid3                 # Music tagger
        lsd                  # ls with icons
        powerline-go         # Powerline with icons
        quickgui
        swww                 # Image
        termusic             # Terminal Rust music player
        vlc
        wezterm
        xwayland-satellite
        yazi
        zellij               # Window multipletex

         legcord

        # Windows
        wineWowPackages.stableFull
      ] ++ [
        inputs.nix-nvim.packages.${system}.default
        inputs.noctalia.packages.${system}.default
        inputs.quickshell.packages.${system}.default
      ];
    };
  };
}
