{ config, pkgs, ... }:

{
  sops.secrets."WEBSITE_TAG" = {
    sopsFile = ../secrets/password.yaml;
    owner = "theeasternfurry";       # Tên user của bạn
    group = "users";                 # Nhóm mặc định thường là "users"
  };
  sops.age.keyFile = "/home/theeasternfurry/.config/sops/age/keys.txt";

  environment = {
    extraInit = ''
      unset -v SSH_ASKPASS
    '';
    sessionVariables = {
      WEBSITE_TAG_FILE = config.sops.secrets."WEBSITE_TAG".path;
    };
    systemPackages = [
      pkgs.dmidecode

      # Tools
      pkgs.efibootmgr
      pkgs.usbutils

      pkgs.htop
      pkgs.virt-manager
      pkgs.pciutils
    ];
  };
}
