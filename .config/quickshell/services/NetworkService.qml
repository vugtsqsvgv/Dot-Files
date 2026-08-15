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

Singleton{
    id:root
    property var wifiDevice: Networking.devices.values.find(d => d.type === DeviceType.Wifi )
    property var network : wifiDevice ? wifiDevice.networks.values.find(n => n.state === ConnectionState.Connected ) : null
    property string networkName : network ? network.name : null

    property real signal : network ? network.signalStrength : 0

    property string icon :{
        if (!network || signal === 0) return String.fromCodePoint(0xf092f)
        if(signal < 0.25) return String.fromCodePoint(0xf091f)
        if(signal < 0.5) return String.fromCodePoint(0xf0922)
        if(signal < 0.75) return String.fromCodePoint(0xf0925)
        return String.fromCodePoint(0xf0928)
        
    }
}