#!/bin/bash

cd ~/BindassBoost_a110/mediatek/config/s9081

if [ "4.2" == "$1" ]; then
	echo "4.2 unified selected"
	Ramdisk="4.2ramdisk"
	cp 4.2uProjectConfig.mk ProjectConfig.mk

elif [ "4.2ics" == "$1" ]; then
	echo "4.2 ics selected"
	Ramdisk="4.2ramdisk"
	cp 4.2icsProjectConfig.mk ProjectConfig.mk

elif [ "4.1" == "$1" ]; then
	echo "4.1 selected"
	Ramdisk="4.1ramdisk"
	cp 4.1ProjectConfig.mk ProjectConfig.mk

else
	echo "wrong option"
	exit
fi

#setting build
cd ~/BindassBoost_a110/kernel
export ARCH=arm
export PATH=~/toolchain/Arm_A9_linaro_4.8.3/bin:$PATH
export CROSS_COMPILE=arm-gnueabi-
TARGET_PRODUCT=s9081 MTK_ROOT_CUSTOM=../mediatek/custom/ make -j5

#adding 512kb header
cd ~/BindassBoost_a110/mediatek/build/tools
./mkimage ~/BindassBoost_a110/kernel/arch/arm/boot/zImage KERNEL > ~/BindassBoost_a110/mtktools/zimage

#copying modules
cp ~/BindassBoost_a110/kernel/drivers/staging/zram/zram.ko ~/BindassBoost_a110/mtktools/BBFZ/system/lib/modules/zram.ko
cp ~/BindassBoost_a110/mediatek/platform/mt6577/kernel/drivers/m4u/m4u.ko ~/BindassBoost_a110/mtktools/BBFZ/system/lib/modules/m4u.ko

#repacking boot
cd ~/BindassBoost_a110/mtktools
./repack.pl -boot zimage $Ramdisk ~/BindassBoost_a110/mtktools/BBFZ/boot.img

#creating flashable zip
cd ~/BindassBoost_a110/mtktools/BBFZ
zip -r out .
mv ~/BindassBoost_a110/mtktools/BBFZ/out.zip ~/BindassBoost_a110/out/BindassBoost_v.zip


