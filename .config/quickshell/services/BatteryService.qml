pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import qs.components
import qs.services

import "root:/"

Singleton {
    id: root

    property var battery: UPower.displayDevice
    property bool present : battery.isPresent
    property bool charging: battery.state === UPowerDeviceState.Charging
    property int level: Math.round(battery.percentage * 100)

    property string icon: {
        if (charging)
            return String.fromCodePoint(0xf0084);
        if (level <= 10)
            return String.fromCodePoint(0xf243);
        if (level <= 50)
            return String.fromCodePoint(0xf242);
        if (level <= 75)
            return String.fromCodePoint(0xf241);
        return String.fromCodePoint(0xf240);
    }
}
