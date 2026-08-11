import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import qs.services
import qs.components

import "root:/"

Container{

    id: root

    height : Config.barHeight
    width : vIcon.implicitWidth + vText.implicitWidth + 4*4

    border{
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

        CustomTextIcon{
            anchors.centerIn : parent
            
            text: AudioService.icon
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
        CustomText{
            anchors.centerIn : parent
            
            text: AudioService.vol + "%"
        }
        }

    }

    MouseArea{
        anchors.fill: parent
        onClicked:{Hyprland.dispatch("hl.dsp.exec_cmd('qs ipc call audioCenter toggle')")}
    }

}