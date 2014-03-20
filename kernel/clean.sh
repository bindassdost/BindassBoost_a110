export ARCH=arm
export PATH=~/toolchain/arm-eabi-linaro-4.6.2/bin:$PATH
export CROSS_COMPILE=arm-eabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make clean
