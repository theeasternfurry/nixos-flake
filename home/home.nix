{
  home = {
    username = "theeasternfurry";
    homeDirectory = "/home/theeasternfurry";

    stateVersion = "25.11";
  };

  imports = [ ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
