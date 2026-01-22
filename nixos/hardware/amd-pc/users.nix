{
  pkgs,
  inputs,
  system,
  ...
}:

{
  users.users = {
    theeasternfurry = {
      isNormalUser = true;
      description = "theeasternfurry";
      extraGroups = [
        "audio"
        "input"
        "libvirtd"
        "networkmanager"
        "render"
        "video"
        "wheel"
      ];
      packages =
        with pkgs;
        [
          # Development
          brave
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
          fastfetch # Fetch system tools
          lsd # ls with icons
          powerline-go # Powerline with icons
          termusic # Terminal Rust music player
          xfce.thunar # File manager
          wezterm
          xwayland-satellite
          yazi
          zellij # Window multipletex

          protonvpn-gui
          legcord
        ]
        ++ [
          inputs.nix-nvim.packages.${system}.default
          inputs.noctalia.packages.${system}.default
          inputs.veloren.packages.${system}.veloren-voxygen
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
      packages =
        with pkgs;
        [
          # Development
          godot

          # Icons
          catppuccin-cursors.latteLight
          papirus-icon-theme

          # Internet
          firefox

          # Tools
          alacritty-graphics # Terminal
          bottom # terminal system tool
          kdePackages.ark
          lsd # ls with icons
          nwg-look # Change apperance
          powerline-go # Powerline with icons
          xfce.thunar # File manager
          xwayland-satellite
        ]
        ++ [
          inputs.noctalia.packages.${system}.default
        ];
    };
  };
}
