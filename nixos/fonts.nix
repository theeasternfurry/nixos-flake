{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    barlow
    font-awesome
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
