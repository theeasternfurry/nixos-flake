{ config, ... }:

{
  virtualisation.oci-containers = {
    backend = "podman";
    containers = {
      "website" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/website:ba1e3f9ed7091d8ce211f4c81b5f3bec186f5ca8";
        ports = [ "0.0.0.0:3000:3000" ];
        autoStart = true;
      };
      "api" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/api:a9797c87fee5069efcbc57b8160754848048280d";
        ports = [ "0.0.0.0:5000:5000" ];
        extraOptions = [ "--network=host" ];
        environmentFiles = [ 
          config.sops.secrets."api-env".path
        ];
        autoStart = true;
      };
      "veloren-server" = {
        image = "registry.gitlab.com/veloren/veloren/server-cli:weekly";
        ports = [
          "14004:14004"
          "14005:14005"
          "14006:14006/udp"
        ];
        volumes = [
          "/var/lib/veloren/userdata:/opt/userdata"
        ];
        environment = {
          "RUST_LOG" = "debug,common::net=info";
        };
        extraOptions = [
          "-i"
          "-t"
          "--network=bridge"
        ];
      };
    };
  };
}
