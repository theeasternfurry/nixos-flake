{
  networking = {
    enableIPv6 = true;
    hostName = "nixos";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 14004 14005 ];
      allowedUDPPorts = [ 80 443 14006 ];
    extraCommands = ''
      # Chặn IP đang tấn công
      iptables -A INPUT -s 185.177.72.49 -j DROP
      ip6tables -A INPUT -s 185.177.72.49 -j DROP 2>/dev/null || true
    '';
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
