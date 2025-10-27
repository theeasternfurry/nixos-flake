{
  home = {
    username = "theeasternfurry";
    homeDirectory = "/home/theeasternfurry";

    stateVersion = "25.05";
  };

  imports = [ ./alacritty.nix ./cursor.nix ./firefox.nix ./helix.nix ./qutebrowser.nix ./xdg.nix ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
