{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts."beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = false;
      addSSL = true;

      locations."/.well-known/matrix/" = {
        extraConfig = ''
          add_header Content-Type application/json;
          add_header Access-Control-Allow-Origin *;
        '';
      };

      locations."= /.well-known/matrix/server".extraConfig = ''
        return 200 '{"m.server": "matrix.beautifulblossomgarden.io.vn:443"}';
      '';
      locations."= /.well-known/matrix/client".extraConfig = ''
        return 200 '{"m.homeserver": {"base_url": "https://matrix.beautifulblossomgarden.io.vn"}}';
      '';

      locations."/" = {
        extraConfig = ''
          if ($scheme = "http") {
            return 301 https://www.beautifulblossomgarden.io.vn$request_uri;
          }
          return 301 https://www.beautifulblossomgarden.io.vn$request_uri;
        '';
      };
    };

    virtualHosts."matrix.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:6167";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_buffering off;
        '';
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
        extraConfig = ''
          limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;
          limit_req zone=one burst=5 nodelay;
        '';
       };
    };

    virtualHosts."storage.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9000";
        extraConfig = ''
          charset utf-8;
          source_charset utf-8;
          proxy_set_header Host $host;
        '';
      };
    };
 };
}
