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
          bruno
          drawio
          obs-studio
          krita
          gnome-disk-utility
          podman-compose

          # Icons
          catppuccin-cursors.latteLight
          papirus-icon-theme

          # Internet
          brave
          firefox

          # Tools
          fastfetch # Fetch system tools
          lsd # ls with icons
          powerline-go # Powerline with icons
          termusic # Terminal Rust music player
          wezterm
          xwayland-satellite
          yazi
          zellij # Window multipletex

          protonvpn-gui
          legcord
        ]
        ++ [
          inputs.nixvim.packages.${system}.default
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
          bottom # terminal system tool
          lsd # ls with icons
          nwg-look # Change apperance
          powerline-go # Powerline with icons
          xwayland-satellite
          wezterm
        ]
        ++ [
          inputs.noctalia.packages.${system}.default
        ];
    };
  };
}
