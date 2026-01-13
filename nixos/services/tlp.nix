{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";

      # Ép máy luôn nhận diện là đang cắm sạc
      TLP_DEFAULT_MODE = "AC";
      TLP_PERSISTENT_DEFAULT = 1;

      # Tắt các chế độ tiết kiệm điện năng cho linh kiện
      PCIE_ASPM_ON_AC = "performance";
    };
  };
}
