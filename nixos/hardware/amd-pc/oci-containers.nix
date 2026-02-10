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
        image = "ghcr.io/beautiful-blossom-garden/website:latest";
        labels = {
          "io.containers.autoupdate" = "image";
        };
        extraOptions = [ "--pull=always" ];
        ports = [ "0.0.0.0:3000:3000" ];
        autoStart = true;
      };

      "api" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/api:latest";
        labels = {
          "io.containers.autoupdate" = "image";
        };
        extraOptions = [ "--network=host" "--pull=always" ];
        ports = [ "0.0.0.0:5000:5000" ];
        environmentFiles = [ 
          config.sops.secrets."api-env".path
        ];
        autoStart = true;
      };

      "api-trading" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/api-trading:latest";
        labels = {
          "io.containers.autoupdate" = "image";
        };
        extraOptions = [ "--network=host" "--pull=always" ];
        ports = [ "0.0.0.0:8000:8000" ];
        environmentFiles = [ 
          config.sops.secrets."api-trading-env".path
        ];
        autoStart = true;
      };

      "veloren-server" = {
        image = "registry.gitlab.com/veloren/veloren/server-cli:weekly";
        labels = {
          "io.containers.autoupdate" = "image";
        };
        extraOptions = [
          "-i"
          "-t"
          "--network=bridge"
          "--pull=always"
        ];
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
        autoStart = false;
      };

      "rustfs" = {
        image = "docker.io/rustfs/rustfs:latest";
        labels = {
          "io.containers.autoupdate" = "image";
        };
        extraOptions = [ "--user=0:0" "--privileged" "--replace" "--pull=always" ];
        ports = [ "9000:9000" "9001:9001" ];
        volumes = [
          "/var/lib/rustfs/data:/data:Z"
          "/var/lib/rustfs/logs:/logs:Z"
        ];
        autoStart = true;
      };
    };
  };

  systemd = {
    tmpfiles.rules = [
      "d /var/lib/veloren/userdata 0755 root root -"
      "d /var/lib/rustfs/data 0755 root root -"
      "d /var/lib/rustfs/logs 0755 root root -"
    ];
  };
}
