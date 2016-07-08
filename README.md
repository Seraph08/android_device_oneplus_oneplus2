To build with the AOSP-CAF repo copy this to your local_manifests
````bash
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="Seraph08/device_oneplus_oneplus2" path="device/oneplus/oneplus2" remote="github" revision="caf" />
  <project name="Seraph08/android_device_oppo_common" path="device/oppo/common" remote="github" revision="m6.0" />
  <project name="Seraph08/android_kernel_oneplus_msm8994" path="kernel/oneplus/msm8994" remote="github" revision="cm-13.0" />
  <project name="TheMuppets/proprietary_vendor_oneplus" path="vendor/oneplus" remote="github" revision="cm-13.0" />
  <project path="hardware/qcom/display-caf/msm8994" name="CyanogenMod/android_hardware_qcom_display" groups="pdk,qcom,qcom_display" revision="cm-13.0-caf-8994" />
  <project path="hardware/qcom/audio-caf/msm8994" name="CyanogenMod/android_hardware_qcom_audio" groups="qcom,qcom_audio" revision="cm-13.0-caf-8994" />
  <project path="hardware/qcom/media-caf/msm8994" name="CyanogenMod/android_hardware_qcom_media" groups="qcom" revision="cm-13.0-caf-8994" />
 </manifest>
```

Building the source
---------------

The source at AOSP-CAF is well configured for building.

    $ . build/envsetup.sh
    $ lunch aosp_device-userdebug
    $ make -jX otapackage

where X is the number of jobs you would like to allot to the build system.

Device configuration for OnePlus Two.
=====================================

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Quad-core 1.8 GHz ARM® Cortex™ A57 and quad-core 1.5 GHz ARM® Cortex™ A53
CHIPSET | Qualcomm MSM8994 Snapdragon 810
GPU     | Adreno 430
Memory  | 3/4 GB
Shipped Android Version | 5.1.1
Storage | 16/64 GB
Battery | 3300 mAh (non-removable)
Dimensions | 151.8 x 74.9 x 9.85 mm
Display | 1.920 x 1.080
Rear Camera  | 13 MP, dual-LED flash
Front Camera | 5 MP
Release Date | July 2015

![OnePlus Two](http://cdn2.gsmarena.com/vv/pics/oneplus/oneplus-two-1.jpg "OnePlus Two")
