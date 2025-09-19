{
  virtualisation = {
    docker = {
      enable = true;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd.enable = true;
  };
  programs.dconf.enable = true;
}
