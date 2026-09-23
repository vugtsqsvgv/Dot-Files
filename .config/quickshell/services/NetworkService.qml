pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import Quickshell.Networking

import "root:/"

Singleton {
    id: root
    property var device: Networking.devices
    property var connectedDevice: device ? device.values.find(d => d.state === ConnectionState.Connected) : null
    property bool isWifi: connectedDevice ? connectedDevice.type === DeviceType.Wifi : false
    property var wifiDevices: device ? device.values.find(d => d.type === DeviceType.Wifi) : null
    property var wifiNetworks: wifiDevices ? wifiDevices.networks : null
    property var network: connectedDevice ? connectedDevice.networks.values.find(n => n.state === ConnectionState.Connected) : null
    property string networkName: network ? network.name : null
    property real signal: network ? network.signalStrength : 0

    Component.onCompleted: {
        if (wifiDevices) {
            wifiDevices.scannerEnabled = true;
        }
    }

    property string icon: {
        if (isWifi) {
            if (!network || signal === 0)
                return String.fromCodePoint(0xf092f);
            if (signal < 0.25)
                return String.fromCodePoint(0xf091f);
            if (signal < 0.5)
                return String.fromCodePoint(0xf0922);
            if (signal < 0.75)
                return String.fromCodePoint(0xf0925);
            return String.fromCodePoint(0xf0928);
        } else {
            if (connectedDevice)
                return String.fromCodePoint(0xf0317);
            return "-";
        }
    }
}
