cd ~/BindassBoost_a110/kernel
export ARCH=arm
export PATH=~/toolchain/Arm_A9_linaro_4.8.3/bin:$PATH
export CROSS_COMPILE=arm-gnueabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make clean
rm -r ~/BindassBoost_a110/mtktools/temp/symbols
rm -r ~/BindassBoost_a110/mtktools/temp/system
rm -r ~/BindassBoost_a110/mtktools/BBFZ/system/lib/modules/*.ko
rm ~/BindassBoost_a110/mtktools/BBFZ/boot.img
rm ~/BindassBoost_a110/mtktools/zimage
