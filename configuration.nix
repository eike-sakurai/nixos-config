{config, pkgs, ...}:
{

  ## BOOT LOADER
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
  
  ## NETWORKING
  networking.hostName = "eike-sakurai";
  networking.networkmanager.enable = true;

  ## TIMEZONE
  time.timeZone = "America/Sao_Paulo";

  ## ALLOW UNFREE PACKAGES
  nixpkgs.config.allowUnfree = true;
  
  ## PACKAGES
  environment.systemPackages = with pkgs; [
    vim
    brightnessctl
    playerctl
  ];
  
  ## GREETER
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  
  ## HYPRLAND
  Programs.hyprland.enable = true;

  ## AUDIO
  { 
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  ## BLUETOOTH
  { 
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

    hardware.graphics = {
    enable = true;
  };
  
  ## NVIDIA
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  ## PRINTING
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  ## USERS
  users.users.eike-sakurai = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager"];
  };

  ## ALLOW FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  system.stateVersion = "25.11";

}
