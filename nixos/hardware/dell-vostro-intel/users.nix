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
        joplin-desktop
        kid3                 # Music tagger
        powerline-go         # Powerline with icons
        quickgui
        swww                 # Image
        vlc
        wezterm
        xwayland-satellite

        # Terminal tools
        bluetui     # Bluetooth tui
        fastfetch   # Fetch info system
        lsd         # ls command in rust
        termusic
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
