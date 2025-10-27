{ pkgs, ... }:

{
  environment = {
    extraInit = ''
      unset -v SSH_ASKPASS
    '';
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
