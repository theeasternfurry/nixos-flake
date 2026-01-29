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
        image = "ghcr.io/beautiful-blossom-garden/website:5aa49ecc4653319b31dff7ec3273988846bd7225";
        ports = [ "0.0.0.0:3000:3000" ];
        autoStart = true;
      };

      "api" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/api:a34e63e7586def3b86b8a71f350ea1ecc8ba2c7f";
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

      "rustfs" = {
        image = "rustfs/rustfs:latest";
        extraOptions = [ "--user=0:0" "--privileged" ];
        ports = [ "9000:9000" "9001:9001" ];
        volumes = [
          "/var/lib/rustfs/data:/data:Z"
          "/var/lib/rustfs/logs:/logs:Z"
        ];
        autoStart = true;
      };
    };
  };
}
