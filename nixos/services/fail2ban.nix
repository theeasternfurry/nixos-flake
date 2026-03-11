{
  services.fail2ban = {
    enable = true;
    
    ignoreIP = [
      "127.0.0.0/8"       # localhost
      "10.0.0.0/8"        # mạng nội bộ
      "172.16.0.0/12"     # mạng nội bộ
      "192.168.0.0/16"    # mạng nội bộ
      "171.252.35.53"
    ];

    # Ban tăng dần - càng tái phạm càng ban lâu
    bantime = "24h";
    bantime-increment = {
      enable = true;           # Bật chế độ tăng thời gian ban
      multipliers = "1 2 4 8 16 32 64"; # Tăng gấp đôi sau mỗi lần
      maxtime = "168h";         # Tối đa 1 tuần
      overalljails = true;      # Tính tổng các lần vi phạm
    };

    # Cấu hình các jail (nhà tù) cho từng loại tội phạm
    jails = {
      # JAIL 1: Bắt bọn quét lỗ hổng PHP, .env, container...
      nginx-badbots = {
        settings = {
          enabled = true;
          filter = "nginx-botsearch";  # Filter có sẵn để bắt bot
          logpath = "/var/log/nginx/access.log";
          maxretry = 3;                  # Chỉ 3 lần 404 là bay màu
          findtime = 300;                 # Trong vòng 5 phút
          bantime = "24h";                # Ban 1 ngày cho lần đầu
          action = "iptables-multiport[name=HTTP, port=\"http,https\"]";
        };
      };

      # JAIL 2: Bắt bọn quá khích vượt rate limit
      nginx-limit-req = {
        settings = {
          enabled = true;
          filter = "nginx-limit-req";    # Filter cho rate limiting
          logpath = "/var/log/nginx/error.log";
          maxretry = 5;                  # Vượt rate 5 lần
          findtime = 60;                  # Trong 1 phút
          bantime = "12h";                # Ban nửa ngày
          action = "iptables-multiport[name=ReqLimit, port=\"http,https\"]";
        };
      };
    };
  };
}
