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
        image = "ghcr.io/beautiful-blossom-garden/website:8fdb63d24b4e112fba41fa9d1e65cd3e478336a7";
        ports = [ "0.0.0.0:3000:3000" ];
        autoStart = true;
      };

      "api" = {
        login = {
          registry = "ghcr.io";
          username = "theeasternfurry";
          passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
        };
        image = "ghcr.io/beautiful-blossom-garden/api:a5bf31f4c7a7772ea5accb5f6922a3826ab1236c";
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
        autoStart = false;
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

  systemd = {
    tmpfiles.rules = [
      "d /var/lib/veloren/userdata 0755 root root -"
      "d /var/lib/rustfs/data 0755 root root -"
      "d /var/lib/rustfs/logs 0755 root root -"
    ];
  };
}
