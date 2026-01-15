{
  networking = {
    enableIPv6 = true;
    hostName = "nixos";
    firewall = {
      enable = false;
      allowedTCPPorts = [ 3000 8080 ];
      allowedUDPPorts = [ 3000 8080 ];
    };
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless.iwd.enable = true;
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
