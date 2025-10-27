{
  programs.wezterm.enable = true;

  xdg.configFile = {
    "wezterm" = {
      source = ../dotfiles/wezterm;
      recursive = true;
    };
  };
}
