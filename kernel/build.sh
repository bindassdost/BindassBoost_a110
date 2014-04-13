export ARCH=arm
export PATH=~/toolchain/Arm_A9_linaro_4.8.3/bin:$PATH
export CROSS_COMPILE=arm-gnueabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make -j5
cd ~/BindassBoost_a110/mediatek/build/tools
./mkimage ~/BindassBoost_a110/kernel/arch/arm/boot/zImage KERNEL > ~/mtktools/4.2zimage
cd ~/mtktools
./repack.pl -boot 4.2zimage 4.2ramdisk boot.img
