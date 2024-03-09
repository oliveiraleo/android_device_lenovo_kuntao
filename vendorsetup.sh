echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/oliveiraleo/android_kernel_lenovo_msm8953 -b lineage-18.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/TheMuppets/proprietary_vendor_lenovo/ -b lineage-18.1 vendor/lenovo

echo 'Erasing previously applied patches, if any...'
cd frameworks/base
rm -rf *.patch*
cd ../..
cd vendor/lineage
rm -rf *.patch*
cd ../..

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Frameworks base'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-19.1/framework_base/0024-Spoof-build-fingerprint-for-Google-Play-Services.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-19.1/framework_base/0025-Update-Spoof-fingerprint-patch
patch -p1 <0024-Spoof-build-fingerprint-for-Google-Play-Services.patch
patch -p1 <0025-Update-Spoof-fingerprint-patch
cd ../..

echo 'Adding patch to Vendor lineage'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-19.1/vendor_lineage/0001-Disable-OtaUpdateActivity-component.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-Kuntao/lineage-19.1/vendor_lineage/0002-Disable-a-couple-more-OTA-upgrade-components.patch
patch -p1 <0001-Disable-OtaUpdateActivity-component.patch
patch -p1 <0002-Disable-a-couple-more-OTA-upgrade-components.patch
cd ../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
