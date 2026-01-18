{pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    kitty
    brightnessctl
    playerctl
  ];

}
