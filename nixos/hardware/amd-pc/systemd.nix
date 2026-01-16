{
  systemd.services.docker-api = {
    after = [ "sops-nix.service" ];
    requires = [ "sops-nix.service" ];
  };
}
