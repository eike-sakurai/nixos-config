# My personal NixOS Config
My personal NixOS config, honestly it's not great, but it's convenient to publish in GitHub.

## Installation

To install my NixOS config, follow these steps:

1. **Install NixOS**: You can enter the NixOS [download page](https://nixos.org/download/) and download the minimal version.
2. **Create partitions for our OS**: Create a 1GB Boot partition with the "EFI System", and create a partition for the rest of the storage remaining.

```bash
lsblk -f
sudo cfdisk /dev/[disk]
```

3. **Make system files for the partitions**:

```bash
mkfs.ext4 -L nixos /dev/[diskp2]
mkfs.fat -F 32 -n boot /dev/[diskp1]
```

4. **Make system files for the partitions**:

```bash
mount /dev/[diskp2] /mnt
mount --mkdir /dev/[diskp1] /mnt/boot
```

5. **Clone the Repository**:

```bash
git clone https://github.com/eike-sakurai/nixos-config
cd nixos-config
```

> [!NOTE]
> You might want to change some configs, for example the username. Vim and Nano are installed by default on NixOS installation, so use it as your will.

6. **Generate the NixOS default config**:
   
```
sudo nixos-generate-config --root /mnt
sudo rm -f /mnt/etc/nixos/configuration.nix
```

7. **Move all my config files to /etc/nixos**:
   
```bash
mv ./configurations /mnt/etc/nixos
mv ./home-manager /mnt/etc/nixos
mv ./configuration.nix /mnt/etc/nixos
mv ./flake.nix /mnt/etc/nixos
```

8. **Install NixOS**:
   
```bash
sudo nixos-install
```

> [!NOTE]
> You can't login in SDDM yet, you have to press "Ctrl+Alt+F2" to exit SDDM, enter into root, set a password for your user by using the command "passwd [user]". After all that you can login on SDDM.

## Enjoy!
