{ pkgs, ... }:

{
  environment = {
    extraInit = ''
      unset -v SSH_ASKPASS
    '';
    sessionVariables = {
      EDITOR = "nvim";
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
