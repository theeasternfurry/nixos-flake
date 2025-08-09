{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.canon-capt
    ];
  };
}
