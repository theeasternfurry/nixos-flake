{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      
      locations."/.well-known/matrix/server".extraConfig = ''
        add_header Content-Type application/json;
        return 200 '{"m.server": "matrix.beautifulblossomgarden.io.vn:443"}';
      '';

      locations."/.well-known/matrix/client".extraConfig = ''
        add_header Content-Type application/json;
        add_header Access-Control-Allow-Origin *;
        return 200 '{"m.homeserver": {"base_url": "https://matrix.beautifulblossomgarden.io.vn"}}';
      '';

      locations."/".return = "301 https://www.beautifulblossomgarden.io.vn$request_uri";
    };

    virtualHosts."matrix.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/_matrix/" = {
        proxyPass = "http://127.0.0.1:6167";
      };
    };

    virtualHosts."www.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
        proxyWebsockets = true;
       };
    };

    virtualHosts."api.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:5000";
        proxyWebsockets = true;
       };
    };
 };
}
