{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Wikipedia";
              tags = [ "wiki" ];
              keyword = "wiki";
              url = "https://en.wikipedia.org/wiki/Main_Page";
            }
            {
              name = "Nix sites";
              bookmarks = [
                {
                  name = "homepage";
                  url = "https://nixos.org/";
                }
              ];
            }
          ];
        };
      };
    };
  };
}
