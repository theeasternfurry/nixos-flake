{
  services.matrix-continuwuity = {
    enable = false;
    settings = {
      global = {
        server_name = "beautifulblossomgarden.io.vn";
        allow_registration = false;
        allow_encryption = true;
        allow_federation = false;
        max_request_size = 20000000;
        address = [
          "127.0.0.1"
          "::1"
        ];
        port = [
          6167
        ];
        trusted_servers = [ "matrix.org" "nixos.org" ];
      };
    };
  };
}
