{
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    appendHttpConfig = ''
      limit_req_zone $binary_remote_addr zone=one:10m rate=5r/s;
    '';
    commonHttpConfig = ''
      # Cloudflare IPv4 CIDRs
      set_real_ip_from 103.21.244.0/22;
      set_real_ip_from 103.22.200.0/22;
      set_real_ip_from 103.31.4.0/22;
      set_real_ip_from 104.16.0.0/13;
      set_real_ip_from 104.24.0.0/14;
      set_real_ip_from 108.162.192.0/18;
      set_real_ip_from 131.0.72.0/22;
      set_real_ip_from 141.101.64.0/18;
      set_real_ip_from 162.158.0.0/15;
      set_real_ip_from 172.64.0.0/13;
      set_real_ip_from 173.245.48.0/20;
      set_real_ip_from 188.114.96.0/20;
      set_real_ip_from 190.93.240.0/20;
      set_real_ip_from 197.234.240.0/22;
      set_real_ip_from 198.41.128.0/17;

      real_ip_header CF-Connecting-IP;

      map $http_cf_ipcountry $is_vietnam {
        default 0;
        VN 1;
      }

      geo $block_non_cf {
        default 1;
        # Cloudflare IPv4
        103.21.244.0/22 0;
        103.22.200.0/22 0;
        103.31.4.0/22 0;
        104.16.0.0/13 0;
        104.24.0.0/14 0;
        108.162.192.0/18 0;
        131.0.72.0/22 0;
        141.101.64.0/18 0;
        162.158.0.0/15 0;
        172.64.0.0/13 0;
        173.245.48.0/20 0;
        188.114.96.0/20 0;
        190.93.240.0/20 0;
        197.234.240.0/22 0;
        198.41.128.0/17 0;
    }
    '';

    virtualHosts."beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      globalRedirect = "www.beautifulblossomgarden.io.vn";

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
        extraConfig = ''
          if ($block_non_cf = 1) {
            return 403 "Only Cloudflare allowed";
          }

          if ($http_cf_ipcountry != "VN") {
            return 403 "Vietnam only";
          }
        '';
       };
    };

    virtualHosts."api.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:5000";
        proxyWebsockets = true;
        extraConfig = ''
          if ($block_non_cf = 1) {
            return 403 "Only Cloudflare allowed";
          }

          if ($http_cf_ipcountry != "VN") {
            return 403 "Vietnam only";
          }

          limit_req zone=one burst=10 nodelay;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Real-IP $remote_addr;
        '';
       };
    };

    virtualHosts."storage.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9000";
        extraConfig = ''
          if ($block_non_cf = 1) {
            return 403 "Only Cloudflare allowed";
          }

          if ($http_cf_ipcountry != "VN") {
            return 403 "Vietnam only";
          }

          charset utf-8;
          source_charset utf-8;
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Real-IP $remote_addr;
        '';
      };
    };

    virtualHosts."trading-shop.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3001";
        proxyWebsockets = true;
        extraConfig = ''
          if ($block_non_cf = 1) {
            return 403 "Only Cloudflare allowed";
          }

          if ($http_cf_ipcountry != "VN") {
            return 403 "Vietnam only";
          }
        '';
       };
    };

    virtualHosts."api-trading-shop.beautifulblossomgarden.io.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8000";
        proxyWebsockets = true;
        extraConfig = ''
          if ($block_non_cf = 1) {
            return 403 "Only Cloudflare allowed";
          }

          if ($http_cf_ipcountry != "VN") {
            return 403 "Vietnam only";
          }

          limit_req zone=one burst=10 nodelay;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Real-IP $remote_addr;
        '';
       };
    };

    virtualHosts."mocthuy.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3002";
        proxyWebsockets = true;
       };
    };

    virtualHosts."api.mocthuy.vn" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8001";
        proxyWebsockets = true;
        extraConfig = ''
          limit_req zone=one burst=10 nodelay;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Real-IP $remote_addr;
        '';
       };
    };
 };
}
