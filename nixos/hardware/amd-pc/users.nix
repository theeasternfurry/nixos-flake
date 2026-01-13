{ pkgs, inputs, system, ... }:

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
        "render"
        "video"
        "wheel"
      ];
      packages = with pkgs;  [
        # Development
        bruno
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

        # Tools
        alacritty-graphics   # Terminal
        fastfetch            # Fetch system tools
        helix                # Terminal text editor
        lsd                  # ls with icons
        powerline-go         # Powerline with icons
        swww                 # Image
        termusic             # Terminal Rust music player
        xfce.thunar          # File manager
        xwayland-satellite
        yazi
        zellij               # Window multipletex

        protonvpn-gui
        legcord
      ] ++ [
       inputs.nix-nvim.packages.${system}.default
      ];
    };
    thevalleyman = {
      isNormalUser = true;
      description = "thevalleyman";
      extraGroups = [
        "audio"
        "input"
        "networkmanager"
        "render"
        "video"
        "wheel"
      ];
      packages = with pkgs;  [
        # Development
        godot

        # Icons
        catppuccin-cursors.latteLight
        papirus-icon-theme

        # Internet
        firefox

        # Tools
        alacritty-graphics   # Terminal
        bottom               # terminal system tool
        helix                # Terminal text editor
        kdePackages.ark    
        lsd                  # ls with icons
        nwg-look             # Change apperance
        powerline-go         # Powerline with icons
        xfce.thunar          # File manager
        xwayland-satellite
      ] ++ [
        inputs.noctalia.packages.${system}.default
      ];
    };
  };
}
