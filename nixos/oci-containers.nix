{ config, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
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
    containers."api" = {
      login = {
        registry = "ghcr.io";
        username = "theeasternfurry";
        passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
      };
      image = "ghcr.io/beautiful-blossom-garden/api:724bdc5bfadc02cab229b12660b5795f57e3de9d";
      ports = [ "0.0.0.0:5000:5000" ];
      extraOptions = [ "--network=host" ];
      environmentFiles = [ 
        config.sops.secrets."api-env".path
      ];
      autoStart = true;
    };
  };
}
