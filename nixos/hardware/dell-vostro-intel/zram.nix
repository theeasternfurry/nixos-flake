{
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 60;
  };
}
