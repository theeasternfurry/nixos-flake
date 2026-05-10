{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "github-actions"
      "nix"
      "toml"
      "proto"
    ];
    userSettings = {
      auto_update = false;

      terminal = {
        shell = {
          program = "fish";
        };
      };

      languages = {
        "Nix" = {
          language_servers = [ "nixd" "!nil" ];
        };
        "Python" = {
          language_servers = [ "ty" "!pyright" ];
        };
        "Proto" = {
          tab_size = 2;
          hard_tabs = false;
        };
      };

      lsp = {
        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs.rust-analyzer;
          };
        };

        nixd = {
          binary = {
            path = lib.getExe pkgs.nixd;
          };
        };

        ty = {
          binary = {
            path = lib.getExe pkgs.ty;
          };
        };
      };

      load_direnv = "shell_hook";
    };
  };
}
