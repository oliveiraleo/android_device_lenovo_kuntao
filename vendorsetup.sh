echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-21 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-21 vendor/lenovo

echo 'Cloning revamped fmradio'
rm -rf packages/apps/RevampedFMRadio && git clone --depth=1 https://github.com/Astridxx/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning dolby atmos'
git clone --depth=1 https://github.com/Astridxx/vendor_dolby -b lineage-21.0 vendor/dolby

echo 'Cloning faceunlock'
git clone --depth=1 https://gitlab.com/crdroidandroid/android_packages_apps_FaceUnlock.git -b 14.0 packages/apps/FaceUnlock

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Bionic'
cd bionic
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/bionic/0001-Implement-per-process-target-SDK-version-override.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/bionic/0002-Squash-of-pre-P-mutex-behavior-restoration.patch
patch -p1 <0001-Implement-per-process-target-SDK-version-override.patch
patch -p1 <0002-Squash-of-pre-P-mutex-behavior-restoration.patch
cd ..

echo 'Adding patch to Build make'
cd build/make
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/build_make/0001-Set-Product-Compressed-Apex-false.patch
patch -p1 <0001-Set-Product-Compressed-Apex-false.patch
cd ../..

echo 'Adding patch to Frameworks base'
rm -rf frameworks/base
git clone --depth 1 https://github.com/oliveiraleo/android_frameworks_base.git -b lineage-21.0 frameworks/base

echo 'Adding patch to Frameworks av'
cd frameworks/av
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0001-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0002-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0003-Do-not-allow-DAP-effect-to-be-suspended.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_av/0004-Restore-clearkey-hidl-code.patch
patch -p1 <0001-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0002-Add-support-for-loading-prebuilt-ddp-decoder-lib.patch
patch -p1 <0003-Do-not-allow-DAP-effect-to-be-suspended.patch
patch -p1 <0004-Restore-clearkey-hidl-code.patch
cd ../..

echo 'Adding patch to Frameworks native'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_native/0001-Disable-gpuservice-on-old-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/frameworks_native/0002-SurfaceFlinger-Disable-SF-HWC-backpressure.patch
patch -p1 <0001-Disable-gpuservice-on-old-BPF-less-kernel.patch
patch -p1 <0002-SurfaceFlinger-Disable-SF-HWC-backpressure.patch
cd ../..

echo 'Adding patch to Frameworks telephony'
rm -rf frameworks/opt/telephony
git clone --depth 1 https://github.com/LineageOS-UL/android_frameworks_opt_telephony.git -b lineage-21.0 frameworks/opt/telephony

echo 'Adding patch to System bpf'
rm -rf system/bpf
git clone --depth 1 https://github.com/LineageOS-UL/android_system_bpf.git -b lineage-21.0 system/bpf


echo 'Adding patch to NetworkStack modules'
rm -rf packages/modules/NetworkStack
git clone --depth 1 https://github.com/LineageOS-UL/android_packages_modules_NetworkStack.git -b lineage-21.0 packages/modules/NetworkStack

echo 'Adding patch to System netd'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0001-Support-no-bpf-usecases.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_netd/0003-Disable-bandwidth-control-for-BPF-less-devices.patch
patch -p1 <0001-Support-no-bpf-usecases.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0003-Disable-bandwidth-control-for-BPF-less-devices.patch
cd ../..

echo 'Adding patch to Services Telephony'
cd packages/services/Telephony
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_services_Telephony/0001-Revert-Remove-deprecated-Radio-1-4-API-and-references.patch
patch -p1 <0001-Revert-Remove-deprecated-Radio-1-4-API-and-references.patch
cd ../../..

echo 'Adding patch to System core'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0002-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0003-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0005-init-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_core/0006-Panic-into-recovery-rather-than-bootloader.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0002-Camera-Add-feature-extensions.patch
patch -p1 <0003-Revert-libprocessgroup-switch-freezer-to-cgroup-v2.patch
patch -p1 <0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0005-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0006-Panic-into-recovery-rather-than-bootloader.patch
cd ../..

echo 'Adding patch to Connectivity modules'
rm -rf packages/modules/Connectivity
git clone --depth 1 https://github.com/LineageOS-UL/android_packages_modules_Connectivity.git -b lineage-21.0 packages/modules/Connectivity


echo 'Adding patch to DnsResolver'
cd packages/modules/DnsResolver
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_modules_DnsResolver/0001-Dont-abort-if-the-DnsHelper-failed-to-init-on-BPF-less-kernel.patch
patch -p1 <0001-Dont-abort-if-the-DnsHelper-failed-to-init-on-BPF-less-kernel.patch
cd ../../..

echo 'Adding patch to System sepolicy'
cd system/sepolicy
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/system_sepolicy/0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
patch -p1 <0001-Fix-storaged-access-to-sys-block-mmcblk0-stat-after.patch
cd ../..

echo 'Adding patch to Trebuchet'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_Trebuchet/0001-Show-clear-all-button-in-recents-overview.patch
patch -p1 <0001-Show-clear-all-button-in-recents-overview.patch
cd ../../..

echo 'Adding patcht to DeskClock'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch to Settings'
cd packages/apps/Settings
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/packages_apps_Settings/0001-Add-a-preference-to-battery-optimization-page.patch
patch -p1 <0001-Add-a-preference-to-battery-optimization-page.patch
cd ../../..

echo 'Adding patch to Vendor lineage'
rm -rf vendor/lineage
# wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-21/vendor_lineage/0001-Restore-target-process-sdk-version-ovveride.patch
# patch -p1 <0001-Restore-target-process-sdk-version-ovveride.patch
# cd ../..
git clone --depth 1 https://github.com/LineageOS-UL/android_vendor_lineage.git -b lineage-21.0 vendor/lineage

echo 'Adding FaceUnlock Support'
cd frameworks/base
wget https://github.com/Astridxx/android_frameworks_base/commit/3f623be42e51cc89ca8eeb8f6738be9a7f232ccb.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/782d87d56b6ae0152cbdd87ebb69ff4291c6ec52.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/46b452a5f07c74d47e91d124fa61b3d9a3267e2c.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/483576c33811b4b6034943f3ee5fef7c5b14077a.patch
patch -p1 <3f623be42e51cc89ca8eeb8f6738be9a7f232ccb.patch
patch -p1 <782d87d56b6ae0152cbdd87ebb69ff4291c6ec52.patch
patch -p1 <46b452a5f07c74d47e91d124fa61b3d9a3267e2c.patch
patch -p1 <483576c33811b4b6034943f3ee5fef7c5b14077a.patch
cd ../..

cd packages/apps/Settings
wget https://github.com/Astridxx/android_packages_apps_Settings/commit/12c2570e75373fd903e2691e4f08a283c3681ce9.patch
wget https://github.com/Astridxx/android_packages_apps_Settings/commit/91baabb9eeb08e02486777704e8e5f3ec00e2523.patch
patch -p1 <12c2570e75373fd903e2691e4f08a283c3681ce9.patch
patch -p1 <91baabb9eeb08e02486777704e8e5f3ec00e2523.patch
cd ../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
