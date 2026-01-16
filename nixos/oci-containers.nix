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
    containers."api" = {
      login = {
        registry = "ghcr.io";
        username = "theeasternfurry";
        passwordFile = config.sops.secrets."GITHUB_TOKEN".path;
      };
      image = "ghcr.io/beautiful-blossom-garden/api:latest";
      ports = [ "0.0.0.0:5000:5000" ];
      extraOptions = [ "--network=host" ];
      environment = {
        DATABASE_URL = config.sops.secrets."DATABASE_URL".path;
        JWT_LOGIN_SECRET = config.sops.secrets."JWT_LOGIN_SECRET".path;
        JWT_AUTH_SECRET = config.sops.secrets."JWT_AUTH_SECRET".path;
        JWT_EXP = config.sops.secrets."JWT_EXP".path;
        USERNAME = config.sops.secrets."USERNAME".path;
        PASSWORD = config.sops.secrets."PASSWORD".path;
        PRODUCTION = config.sops.secrets."PRODUCTION".path;
        OTP_SECRET = config.sops.secrets."OTP_SECRET".path;
      };
      autoStart = true;
    };
  };
}
