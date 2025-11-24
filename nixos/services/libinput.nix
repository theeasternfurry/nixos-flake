{
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
