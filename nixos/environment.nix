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
      EDITOR = "nvim";
      WEBSITE_TAG_FILE = config.sops.secrets."WEBSITE_TAG".path;
    };
    systemPackages = with pkgs; [
      # Secrets
      age  # Generate key
      sops # Open/Close secrets

      dmidecode
      efibootmgr
      usbutils
      htop
      virt-manager
      pciutils
    ];
  };
}
