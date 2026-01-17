{
  imports = [
    ./packages.nix
    ./modules/test.nix
  ];

  home.username = "eike-sakurai";
  home.homeDirectory = "/home/eike-sakurai";
  home.stateVersion = "25.11";
}
