#! /bin/sh

echo "Preparing package feeds..."

./scripts/feeds update -a
./scripts/feeds install -a 

echo "patching  openwrt..."

patch -p1 < ./package/vocore2/openwrt.1806/mt7628/openwrt/000-vocore2-compatible.patch
patch -p1 < ./package/vocore2/openwrt.1806/fix-build-preaper.patch
patch -p1 < ./package/vocore2/openwrt.1806/mt7628/openwrt/luci/010-luci-vocore2-compatible.patch
mkdir ./package/network/utils/iwinfo/patches
cp ./package/vocore2/openwrt.1806/mt7628/openwrt/080-*.patch ./package/network/utils/iwinfo/patches
cp ./package/vocore2/openwrt.1806/.config ./
cp ./package/vocore2/openwrt.1806/004*.patch ./target/linux/ramips/patches-4.14
cp ./package/vocore2/openwrt.1806/0043-spi-add-mt7621-support.patch ./target/linux/ramips/patches-4.14
cp ./package/vocore2/openwrt.1806/811-spi-gpio-chip-select.patch ./target/linux/ramips/patches-4.14
cp ./package/vocore2/openwrt.1806/config-4.14 ./target/linux/ramips/mt76x8/
patch -p 1 --directory=feeds/packages < ./package/vocore2/openwrt.1806/gphoto-v28-libgphoto-v30.patch
