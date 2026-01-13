{
  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    #systemWide = true;
    wireplumber.enable = true;
  };

  # NoiseTorch minimize voice environment
  programs.noisetorch.enable = true;
}
