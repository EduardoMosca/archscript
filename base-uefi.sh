#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime
hwclock --systohc

echo "blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf
echo "LANG=pt_BR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

pacman -S grub efibootmgr networkmanager network-manager-applet dialog iwd reflector base-devel linux-headers avahi gvfs gvfs-smb inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync acpi acpi_call tlp iproute2 dnsmasq nftables ipset firewalld flatpak sof-firmware acpid os-prober ntfs-3g terminus-font dhcpcd dkms

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

useradd -m eduardo
echo eduardo:password | chpasswd

echo "eduardo ALL=(ALL) ALL" >> /etc/sudoers.d/eduardo




