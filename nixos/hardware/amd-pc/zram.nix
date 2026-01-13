{
  zramSwap = {
    enable = true;
    memoryPercent = 100; 
    algorithm = "zstd";
    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 100;
    "vm.vfs_cache_pressure" = 50;
  };
}
