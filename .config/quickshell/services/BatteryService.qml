pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.UPower
import qs.components
import qs.services

import "root:/"

Singleton{
    id: root


    property var battery : UPower.displayDevice
    property bool charging : battery.state === UPowerDeviceState.charging
    property int level : Math.round(battery.percentage * 100)

    property string icon :{
        if (level >= 100) return String.fromCodePoint(0xf240)
        if (level <= 10 ) return String.fromCodePoint(0xf244)
        if ( charging ) return String.fromCodePoint(0xf0084)

        return String.fromCodePoint(0xf243)
    }



}