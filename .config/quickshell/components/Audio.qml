import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import qs.services

import "root:/"

Rectangle{

    id: root

    height : Config.barHeight
    width : vIcon.implicitWidth + vText.implicitWidth + 4*4
    color : Config.bg0
    radius : 16

    border{
        width : 4
        color: {
                if (AudioService.muted || AudioService.vol === 0 ) return Config.red
                return Config.bg1
            }

    }

    RowLayout{

        anchors.fill : parent
        anchors.rightMargin : 4
        anchors.leftMargin : 4


        Item{

            Layout.fillHeight : true
            id: vIcon
            implicitWidth : 32

        Text{
            anchors.centerIn : parent
            
            text: AudioService.icon
            font{
                pixelSize : 16
                family : "JetBrainsMono Nerd Font Propo"
                weight : 500
            }
            color: {
                if (AudioService.muted || AudioService.vol === 0 ) return Config.red
                return "white"
            }
        }
        }


        Item{
            Layout.fillHeight : true
            id: vText
            implicitWidth : 47
        Text{
            anchors.centerIn : parent
            
            text: AudioService.vol + "%"
            font{
                pixelSize : 16
                family : "JetBrainsMono Nerd Font Mono"
                weight : 500
            }
            color : "white"
        }
        }

    }

    MouseArea{
        anchors.fill: parent
        onClicked:{Hyprland.dispatch("hl.dsp.exec_cmd('qs ipc call audioCenter toggle')")}
    }

}