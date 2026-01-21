{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    ranger
    waybar
    hyprpaper
    alacritty
    wofi
    ueberzugpp
    neovim
  ];
}