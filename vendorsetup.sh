echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree'
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/oliveiraleo/android_kernel_lenovo_msm8953 -b lineage-18.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree'
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/TheMuppets/proprietary_vendor_lenovo/ -b lineage-18.1 vendor/lenovo

echo 'Cloning frameworks tree'
rm -rf frameworks/base && git clone --depth=1 https://github.com/oliveiraleo/android_frameworks_base.git -b lineage-18.1 frameworks/base

echo 'Cloning process completed...'

echo 'delete vendorsetup.sh from device tree once this is done'
