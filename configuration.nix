{config, pkgs, ...}:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  ## BOOT LOADER
  boot = {
    loader = {     
      efi = [
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      ];
      grub = [
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = false;
      ]
    };
    supportedFilesystems = [
      "exfat"
    ];
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
  programs.hyprland.enable = true;

  ## AUDIO
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  ## BLUETOOTH
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  ## NVIDIA

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia.prime = {
    sync.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

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

  ## STYLIX
  stylix = {
    enable = true;
    polarity = dark;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };
    image = pkgs.fetchurl {
      url = "https://downloadscdn5.freepik.com/download_vector/jpg/52/52683/20/20285/20285447_6227297.jpg?token=exp=1769244704~hmac=b112a1f64e9ac014f5f2dad1b0c5b2d3&filename=20285447_6227297.jpg";
      sha256 = "fe80acebd38fc05cf53447b0f67deb2c2b039df7e310ddc4f8f818ea2177c48f`";
    };
  };

  ## ALLOW FLAKES
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  system.stateVersion = "25.11";

}
