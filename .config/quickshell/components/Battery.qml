import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.UPower 

import "root:/"


Rectangle{


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

    height : Config.barHeight
    width: layout.implicitWidth + 16
    color : "#121212"
    radius : 16

    border {
        width : 4
        color : root.charging ? "#3d95e7" : (root.level <= 10 ? "#d65434" : root.level <= 30 ? "#dfae33" : root.level <= 70 ? "#8de82d" :  "#23f183" )

    }
    


    RowLayout{

        id : layout

        uniformCellSizes : true

        anchors.fill : parent
        anchors.leftMargin : 8
        anchors.rightMargin : 8

        spacing : 2

        Text{
            text : root.icon
            color : root.charging ? "#3d95e7" : root.level <= 10 ? "#d65434" : root.level <= 30 ? "#dfae33" : root.level <= 70 ? "#8de82d" :  "#23f183" 
            font{
                family : "JetbrainMono Nerd Font Propo"
                pixelSize : 24
            }

        }

        Text{
            text : root.level + "%"
            color : "white"
            font{
                family : "JetbrainMono Nerd Font Mono"
                pixelSize : 16
                weight : 500
            }
        }
    }
}
