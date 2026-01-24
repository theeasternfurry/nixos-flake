{
  home = {
    username = "theeasternfurry";
    homeDirectory = "/home/theeasternfurry";

    stateVersion = "26.05";
  };

  imports = [ ./zed-editor.nix ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
