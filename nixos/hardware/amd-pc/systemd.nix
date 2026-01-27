{
  systemd.tmpfiles.rules = [
    "d /var/lib/veloren/userdata 0755 root root -"
    "d /var/lib/rustfs/data 0755 root root -"
    "d /var/lib/rustfs/logs 0755 root root -"
  ];
}
