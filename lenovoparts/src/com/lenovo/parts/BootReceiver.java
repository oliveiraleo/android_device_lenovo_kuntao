package com.lenovo.parts;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.provider.Settings;

import com.lenovo.parts.FileUtils;
import com.lenovo.parts.SecureSettingSwitchPreference;

public class BootReceiver extends BroadcastReceiver {

    public static final String HEADPHONE_GAIN_PATH = "/sys/kernel/sound_control/headphone_gain";

    public void onReceive(Context context, Intent intent) {

        int gain = Settings.Secure.getInt(context.getContentResolver(),
                DeviceSettings.PREF_HEADPHONE_GAIN, 4);
        FileUtils.setValue(HEADPHONE_GAIN_PATH, gain + " " + gain);

        FileUtils.setValue(DeviceSettings.VIBRATION_STRENGTH_PATH, Settings.Secure.getInt(
                context.getContentResolver(), DeviceSettings.PREF_VIBRATION_STRENGTH, 20) / 100.0 * (DeviceSettings.MAX_VIBRATION - DeviceSettings.MIN_VIBRATION) + DeviceSettings.MIN_VIBRATION);

        FileUtils.setValue(DeviceSettings.GLOVE_MODE_PATH, Settings.Secure.getInt(context.getContentResolver(),
                DeviceSettings.PREF_GLOVE_MODE, 0));

        FileUtils.setValue(DeviceSettings.USB_FASTCHARGE_KEY, Settings.Secure.getInt(context.getContentResolver(),
                DeviceSettings.USB_FASTCHARGE_KEY, 0));
    }
}
