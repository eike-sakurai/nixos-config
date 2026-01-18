{
  imports = [
    ./packages.nix
    ./modules/ranger.nix
  ];

  home.username = "eike-sakurai";
  home.homeDirectory = "/home/eike-sakurai";
  home.stateVersion = "25.11";
}
