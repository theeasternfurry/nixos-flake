{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      canon-capt
      cups-browsed
      cups-filters
    ];
  };
}
