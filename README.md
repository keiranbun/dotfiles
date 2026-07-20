# dotfiles

<div align="center">
<img src="https://thesvg.org/icons/linux/default.svg" width="20%" />
<p>This is my collection of dotfiles that I use on linux</p>
</div>

# Installation (Arch Linux)

- `git clone https://github.com/keiranbun/dotfiles.git`
- `cd dotfiles`
- `sudo chmod +x ./install.sh`

#### Adwaita Folder Colors

- [link](https://github.com/dpejoh/Adwaita-colors)

## Printer (CUPS)

- `http://localhost:631`
- Administration > Add printer

## Chroot

1. ### Get iso/usb ready

- [Download iso](https://archlinux.org/download/)
- Place iso onto usb via [ventoy](https://www.ventoy.net/en/index.html)
- Boot into usb via bios

2. ### Chroot into setup

- `sudo mount /dev/nvme0n1p2 /mnt`
- `sudo mount /dev/nvme0n1p1 /mnt/boot`
- `sudo arch-chroot /mnt`

## Xbox Controller (USB Dongle)

- `sudo pacman -S linux-headers`
- `yay -S xone-dkms-git xone-dongle-firmware`

## Clean up

- `yay -Yc` - Remove orphaned (no longer needed) dependencies installed via AUR helpers like yay.
- `sudo pacman -Sc` - Clear cached packages from previous installations, keeping only those currently installed.
- `rm -rf ~/.cache` - Delete user cache files to free up disk space.

#### .snapshots

- The default `archinstall` setup uses Snapper to create automatic snapshots after each update, which can quickly consume significant disk space.
- Check your current Snapper configurations with:
  - `sudo snapper list-configs`
  - Ideally, only `root '/'` should be listed. Extra entries, such as `home`, are usually unnecessary.
- To remove unnecessary home snapshots:
  - Delete the Snapper home config: `sudo snapper -c home delete-config`
  - Remove any existing home snapshots: `sudo rm -rf /home/.snapshots`

## Fixes

<details>
  <summary>AMDGPU - High Performance on Boot (Fix 144Hz Ultrawide Artifacts)</summary>

- If you have an AMD RX 7600 or similar RDNA3 card, intermittent white/artifact lines can appear at high refresh rates (e.g., 144Hz ultrawide) due to dynamic power management (DPM) downclocking GPU and VRAM.  
  The following steps force **high performance** to fix this.

### 1. Create a udev rule

Open a new udev rule file:

```bash
sudo nvim /etc/udev/rules.d/30-amdgpu-high-performance.rules
```

### 2. Paste the following

```
ACTION=="add", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{power_dpm_force_performance_level}="high"
```

### 3. Reload udev rules and trigger

```bash
sudo udevadm control --reload
sudo udevadm trigger
```

### 4. Verify the setting

```
cat /sys/class/drm/card1/device/power_dpm_force_performance_level
```

- It should display

```ngix
high
```

</details>
