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
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
      HIP_VISIBLE_DEVICES = "0";
      AMD_SERIALIZE_KERNEL = "1";
      OLLAMA_MAX_VRAM = "10737418240";
      OLLAMA_NUM_PARALLEL = "1";
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_KEEP_ALIVE = "10m";
      OLLAMA_DEBUG = "1";
      ROC_ENABLE_PRE_VEGA = "1";
    };
    loadModels = [
      "llama3.1:8b-instruct-q8_0"
    ];
  };
}
