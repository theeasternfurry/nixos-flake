{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = ''
      set -g default-terminal "screen-256color"
      set -as terminal-features ",xterm-256color:RGB"
    '';
  };
}
