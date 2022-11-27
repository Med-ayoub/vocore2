# Welcome

## Download 



```sh
git clone https://github.com/openwrt/openwrt.git
cd openwrt
git checkout v22.03.2
./scripts/feeds update -a
./scripts/feeds install -a 
cd ./package
git clone https://github.com/Med-ayoub/vocore2.git
```

## Apply patches

```sh
patch -p1 < package/vocore2/openwrt.2102/vocore2-sdcard-support.patch
patch -p1 < package/vocore2/openwrt.2203/vocore2-fixmaster-es8388.patch
cp package/vocore2/openwrt.2203/0810-sound-es8388-aplay.patch target/linux/ramips/patches-5.10/
cp ./package/vocore2/openwrt.1907/0882-pinctrl-fix-gpio-name.patch target/linux/ramips/patches-5.10/
patch -p1 --directory=feeds/packages < package/vocore2/openwrt.2203/update-gphoto2-libgphoto2.patch
```
## configure

```sh
make menuconfig
```

select the following config 

  - Target System: MediaTek Ralink MIPS
  - Subtarget: MT76x8 based boards
  - Target Profile: VoCore VoCore2
  - Kernel modules -> Wireless Drivers -> unselect kmod-mt76 and select kmod-mt7628 -> select WiFi Operation Mode -> enable AP-Client support for AP+STA mode; enable SNIFFER for monitor mode.
  - Base System -> select wireless-tools (need its iwpriv)

##compile 

```sh
make download
make 
```



