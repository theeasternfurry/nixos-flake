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

        # Games
        prismlauncher

        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        firefox
        librewolf
        element-desktop
        materialgram
        microsoft-edge
        protonvpn-gui
        legcord

        # Tools
        copyq           # Clipboard
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

        # Terminal development tools
        lsd         # ls command in rust
        yazi        # file manager

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
