{ pkgs, ... }:

{
  services.udev = {
    enable = true;
    packages = [
      pkgs.openrgb-with-all-plugins
    ];
  };
}
