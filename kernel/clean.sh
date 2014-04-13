export ARCH=arm
export PATH=~/toolchain/Arm_A9_linaro_4.8.3/bin:$PATH
export CROSS_COMPILE=arm-gnueabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make clean
