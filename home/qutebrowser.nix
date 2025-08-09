{
  programs.qutebrowser = {
    enable = true;
    quickmarks = { nixpkgs = "https://github.com/NixOS/nixpkgs"; };
    /*
    extraConfig = ''
      import os
      from urllib.request import urlopen

      #config.set("colors.webpage.darkmode.enabled", True)

      if not os.path.exists(config.configdir / "theme.py"):
        theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
        with urlopen(theme) as themehtml:
          with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

      if os.path.exists(config.configdir / "theme.py"):
        import theme
        theme.setup(c, 'frappe', True)
    '';
  */
  };
}
