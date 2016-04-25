rm iso/*
rm gentoo gentoo.iso
rm /boot/efi/boot/gentoo.iso

set -x -e
cp /usr/src/linux/arch/x86_64/boot/bzImage iso/gentoo
pushd initramfs
find . -print0 | cpio -ov -0 --format=newc | gzip -9 > ../iso/mac_init.gz
popd
mkisofs -o gentoo.iso iso/
cp gentoo.iso /boot/efi/boot/gentoo.iso
