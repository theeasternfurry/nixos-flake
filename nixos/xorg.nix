{
  services.xserver = {
    # Keymap in X11
    xkb.layout = "us";
    xkb.variant = "";

    # Enable the X11 window system
    enable = true;
    autorun = true;
  };

  # touchpad support
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      tappingDragLock = true;
      tappingButtonMap = "lrm";
      clickMethod = "clickfinger";
      scrollMethod = "twofinger";
    };
  };
}
