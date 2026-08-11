import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 
import Quickshell.Networking 

import 'root:/'

Rectangle{

    id : root

    width: layout.implicitWidth + 16
    height: Config.barHeight
    radius : 16
    border{
        width: 4
        color: Config.bg1

    }
    color:Config.bg0

    property var wifiDevice: Networking.devices.values.find(d => d.type === DeviceType.Wifi )
    property var network : wifiDevice ? wifiDevice.networks.values.find(n => n.state === ConnectionState.Connected ) : null
    property string networkName : network ? network.name : "-"

    property real signal : network ? network.signalStrength : 0

    readonly property string icon :{
        if (!network || signal === 0) return String.fromCodePoint(0xf092f)
        if(signal < 0.25) return String.fromCodePoint(0xf091f)
        if(signal < 0.5) return String.fromCodePoint(0xf0922)
        if(signal < 0.75) return String.fromCodePoint(0xf0925)
        return String.fromCodePoint(0xf0928)
        
    }

    RowLayout{

        id: layout

        anchors.fill : parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        Text{
            id: icon
            text: root.icon
            font{
                family: "JetBrainsMono Nerd Font Propo"
                pixelSize: 16
                weight: 500
            }
            color : "white"
        }

        Text{
            id: nName
            text: root.networkName
            font{
                family: "JetBrainsMono Nerd Font Propo"
                pixelSize: 16
                weight: 500
            }
            color : "white"
        }

    }



}