{ config, ... }:

{
  virtualisation.oci-containers = {
    backend = "docker";
    containers."website" = {
      login = {
        registry = "ghcr.io";
        username = "theeasternfurry";
        passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
      };
      image = "ghcr.io/beautiful-blossom-garden/website:latest";
      ports = [ "0.0.0.0:3000:3000" ];
      autoStart = true;
    };
  };
}
