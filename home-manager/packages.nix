{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    kdePackages.dolphin
  ];
}