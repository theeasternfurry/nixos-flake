{ pkgs, ... }:

{
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "Simp1e-Adw";
    size = 16;
    package = pkgs.simp1e-cursors;
    x11.defaultCursor = "left_ptr";
  };
}
