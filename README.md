# My personal NixOS Config
My personal NixOS config, honestly it's not great, but it's convenient to publish in GitHub.

## Installation

To install my NixOS config, follow these steps:

1. **Install NixOS**: You can enter the NixOS [download page](https://nixos.org/download/) and download the minimal version.
2. **Clone the Repository**:

```bash
git clone https://github.com/eike-sakurai/nixos-config
cd nixos-config
```

3. **Generate the NixOS default config**:
   
```
sudo nixos-generate-config --root /mnt
sudo rm -f /mnt/etc/nixos/configuration.nix
```

4. **Move all my config files to /etc/nixos**:
   
```bash
mv ./configuration /mnt/etc/nixos
mv ./home-manager /mnt/etc/nixos
mv ./configuration.nix /mnt/etc/nixos
mv ./flake.nix /mnt/etc/nixos
```

5. **Install NixOS**:
   
```bash
sudo nixos-install
```

> [!NOTE]
> The "initialHashedPassword", in another word, the password for user is "123321".

## Enjoy!
