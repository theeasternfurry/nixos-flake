{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    barlow
    font-awesome
    nerd-fonts.victor-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
