# My personal NixOS Config
My personal NixOS config, honestly it's not great, but it's convenient to publish in GitHub.

## Installation
```
git clone https://github.com/eike-sakurai/nixos-config
cd nixos-config

mv ./configuration /mnt/etc/nixos
mv ./home-manager /mnt/etc/nixos
mv ./configuration.nix /mnt/etc/nixos
mv ./flake.nix /mnt/etc/nixos

sudo nixos-generate-config --root /mnt
sudo nixos-install --flake ./
```
