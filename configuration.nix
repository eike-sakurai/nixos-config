{config, ...}:
{
  imports =
    [
      ./hardware-configuration.nix
      ./configurations/packages.nix
      ./configurations/modules/nvidia.nix
      ./configurations/modules/audio.nix
      ./configurations/modules/bluetooth.nix
      ./configurations/modules/printing.nix
    ];

  boot.loader.systemd-boot.enable = false;
  boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };
  grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
  };
};

  networking.hostName = "eike-sakurai";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  nixpkgs.config.allowUnfree = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  users.users.eike-sakurai = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager"];
  };

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  system.stateVersion = "25.11";

}

