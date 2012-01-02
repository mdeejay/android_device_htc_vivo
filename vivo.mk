#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/vivo/init:root/init \
    device/htc/vivo/init.vivo.rc:root/init.vivo.rc \
    device/htc/vivo/init.rc:root/init.rc \
    device/htc/vivo/ueventd.rc:root/ueventd.rc \
    device/htc/vivo/ueventd.vivo.rc:root/ueventd.vivo.rc


#Toushcreen config files
PRODUCT_COPY_FILES += \
    device/htc/vivo/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/vivo/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/htc/vivo/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

#Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/vivo/vivo-vendor.mk)

#Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    keyguard.no_require_sim=true \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=adb,mass_storage \
    sys.media.vdec.sw=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/vivo/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# GSM voicemail config xml file
PRODUCT_COPY_FILES += \
    device/htc/vivo/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Misc
PRODUCT_PACKAGES += \
    lights.vivo \
    sensors.vivo \
    gps.vivo \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    libQcomUI \
    libtilerenderer \
    liboverlay


# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni


# missing packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    com.android.future.usb.accessory \
    Superuser \
    su

# Nexus Prime bootanimation
PRODUCT_COPY_FILES += \
    device/htc/vivo/media/bootanimation.zip:system/media/bootanimation.zip

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/vivo/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/vivo/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad.kcm.bin:system/usr/keychars/vivo-keypad.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ara.kcm.bin:system/usr/keychars/vivo-keypad-ara.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ell.kcm.bin:system/usr/keychars/vivo-keypad-ell.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-fra.kcm.bin:system/usr/keychars/vivo-keypad-fra.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ger.kcm.bin:system/usr/keychars/vivo-keypad-ger.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-ita.kcm.bin:system/usr/keychars/vivo-keypad-ita.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-tur.kcm.bin:system/usr/keychars/vivo-keypad-tur.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-wwe-bopomo.kcm.bin:system/usr/keychars/vivo-keypad-wwe-bopomo.kcm.bin \
    device/htc/vivo/keychars/vivo-keypad-wwe.kcm.bin:system/usr/keychars/vivo-keypad-wwe.kcm.bin

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/vivo/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/vivo/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/vivo/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/vivo/keylayout/vivo-keypad.kl:system/usr/keylayout/vivo-keypad.kl \
    device/htc/vivo/keylayout/vivo-keypad-ara.kl:system/usr/keylayout/vivo-keypad-ara.kl \
    device/htc/vivo/keylayout/vivo-keypad-ell.kl:system/usr/keylayout/vivo-keypad-ell.kl \
    device/htc/vivo/keylayout/vivo-keypad-fra.kl:system/usr/keylayout/vivo-keypad-fra.kl \
    device/htc/vivo/keylayout/vivo-keypad-ger.kl:system/usr/keylayout/vivo-keypad-ger.kl \
    device/htc/vivo/keylayout/vivo-keypad-ita.kl:system/usr/keylayout/vivo-keypad-ita.kl \
    device/htc/vivo/keylayout/vivo-keypad-tur.kl:system/usr/keylayout/vivo-keypad-tur.kl \
    device/htc/vivo/keylayout/vivo-keypad-wwe-bopomo.kl:system/usr/keylayout/vivo-keypad-wwe-bopomo.kl \
    device/htc/vivo/keylayout/vivo-keypad-wwe.kl:system/usr/keylayout/vivo-keypad-wwe.kl \
    device/htc/vivo/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/vivo/keylayout/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl \
    device/htc/vivo/keylayout/elan-touchscreen.kl:system/usr/keylayout/elan-touchscreen.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/vivo/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/vivo/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/vivo/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/vivo/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/vivo/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb \
    device/htc/vivo/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/vivo/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/vivo/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/vivo/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/vivo/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/vivo/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/vivo/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/vivo/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/vivo/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/vivo/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/vivo/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/vivo/gps.conf:system/etc/gps.conf

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/vivo/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/vivo/dsp/AdieHWCodec_NEL.csv:system/etc/AdieHWCodec_NEL.csv \
    device/htc/vivo/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMic_NEL.csv:system/etc/AIC3254_REG_DualMic_NEL.csv \
    device/htc/vivo/dsp/AIC3254_REG_DualMicXB.csv:system/etc/AIC3254_REG_DualMicXB.csv \
    device/htc/vivo/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/vivo/dsp/TPA2051_CFG_NEL.csv:system/etc/TPA2051_CFG_NEL.csv \
    device/htc/vivo/dsp/CodecDSPID_BCLK.txt:system/etc/CodecDSPID_BCLK.txt \
    device/htc/vivo/dsp/CodecDSPID_NEL.txt:system/etc/CodecDSPID_NEL.txt \
    device/htc/vivo/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/vivo/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/vivo/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/vivo/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/vivo/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/vivo/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/vivo/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/vivo/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/vivo/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/vivo/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/vivo/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/vivo/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/vivo/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/vivo/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/vivo/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/vivo/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg

PRODUCT_COPY_FILES += \
    device/htc/vivo/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/vivo/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/vivo/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage spvivo to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# use high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# htc audio settings
$(call inherit-product, device/htc/vivo/media_htcaudio.mk)

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/vivo/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for vivo
PRODUCT_COPY_FILES += \
    device/htc/vivo/proprietary/akmd:/system/bin/akmd \
    device/htc/vivo/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/vivo/proprietary/bootcomplete:/system/bin/bootcomplete \
    device/htc/vivo/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/vivo/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/vivo/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/vivo/proprietary/snd3254:/system/bin/snd3254 \
    device/htc/vivo/proprietary/sh:/system/bin/sh \
    device/htc/vivo/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/vivo/proprietary/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/vivo/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/vivo/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/vivo/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/vivo/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/vivo/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/vivo/proprietary/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
    device/htc/vivo/proprietary/libC2D2.so:/system/lib/libC2D2.so \
    device/htc/vivo/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \
    device/htc/vivo/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/vivo/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/vivo/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/vivo/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/vivo/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/vivo/proprietary/libmmjpeg.so:/system/lib/libmmjpeg.so

PRODUCT_BUILD_PROP_OVERRIDES += \
BUILD_FINGERPRINT="htc_wwe/htc_vivo/vivo:2.3.5/GRJ90/197817.3:user/release-keys" \
BUILD_TYPE="userdebug"

PRODUCT_NAME := htc_vivo
PRODUCT_DEVICE := vivo
PRODUCT_MODEL := HTC Incredible S
PRODUCT_MANUFACTURER := HTC
