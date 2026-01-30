{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    openFirewall = true;
    host = "0.0.0.0";
    port = 11434;
    package = pkgs.ollama-vulkan;
    rocmOverrideGfx = "10.3.0";
    environmentVariables = {
      OLLAMA_NUM_PARALLEL = "1"; # Chạy 1 người dùng thôi để tiết kiệm VRAM
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_KEEP_ALIVE = "10m";

      # Các biến quan trọng để sửa lỗi GGML_ASSERT
      HSA_OVERRIDE_GFX_VERSION = "10.3.0"; 
      HIP_VISIBLE_DEVICES = "0";
      # Vô hiệu hóa phân bổ bộ nhớ phức tạp gây lỗi trên driver cũ
      AMD_SERIALIZE_KERNEL = "1";
      # Ép Ollama không dùng quá nhiều nhân tính toán cùng lúc
      OLLAMA_MAX_VRAM = "10737418240"; # Giới hạn 10GB cho an toàn
    };
    loadModels = [
      "qwen2.5-coder:7b"
    ];
  };
}
