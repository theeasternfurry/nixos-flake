{ outputs, ... }:

{
  imports = [
    # Specific config for amd-pc
    ./acme.nix
    ./hardware.nix
    ./nix-features.nix
    ./oci-containers.nix
    ./sops.nix
    ./users.nix
    ./zram.nix

    ../../boot-loader.nix
    ../../printing.nix
    ../../sound.nix
    ../../networking.nix

    # NixOS system config
    ../../environment.nix
    ../../fonts.nix
    ../../insecure-pkgs.nix
    ../../input-method.nix
    ../../no-packages.nix
    ../../virtualisation.nix

    # Window Manager
    ../../windowmanager/niri.nix

    # Services
    ../../services/playetctld.nix
    ../../services/matrix-continuwuity.nix
    ../../services/nginx.nix
    ../../services/ollama.nix
    ../../services/openssh.nix
    ../../services/postgresql.nix
    ../../services/udev.nix

    # Programs
    ../../programs/fish.nix
    ../../programs/git.nix
    ../../programs/silentSDDM.nix
    ../../programs/steam.nix

    ../../nix-ld.nix
    ../../xdg.nix
  ];

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  programs.light.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities

  system.stateVersion = "26.05";
}
