{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 11434;
    package = pkgs.ollama-rocm;
    rocmOverrideGfx = "10.3.0";
    environmentVariables = {
      OLLAMA_NUM_PARALLEL = "1"; # Chạy 1 người dùng thôi để tiết kiệm VRAM
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_KEEP_ALIVE = "10m";
    };
    loadModels = [
      "deepseek-coder-v2:16b"
    ];
  };
}
