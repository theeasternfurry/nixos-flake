{
  services.nginx = {
    enable = true;

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
