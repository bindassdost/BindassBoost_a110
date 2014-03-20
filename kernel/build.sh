export ARCH=arm
export PATH=~/toolchain/arm-eabi-linaro-4.6.2/bin:$PATH
export CROSS_COMPILE=arm-eabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make -j5
cd ~/BindassBoost_a110/mediatek/build/tools
./mkimage ~/BindassBoost_a110/kernel/arch/arm/boot/zImage KERNEL > ~/mtktools/4.2zimage
cd ~/mtktools
./repack.pl -boot 4.2zimage 4.2boot.img-ramdisk boot.img
