{
  imports =
    [
      ./hardware-configuration.nix
      ./configuration/packages.nix
      ./configuration/modules/nvidia.nix
      ./configuration/modules/audio.nix
      ./configuration/modules/bluetooth.nix
      ./configuration/modules/printing.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "eike-sakurai";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  users.users.eike-sakurai = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager"];
    initialHashedPassword = "$6$cfgeVuIGlHfR9JxA$ZKr2AWIWFXw0RUfmkXyTfkCcFQg1SeglhDA6afZSoBMT4OlkCJPYiEL.WUjuCo/AL5WORCQLse88fYhmNHvL1";
  };

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  system.stateVersion = "25.11";

}

