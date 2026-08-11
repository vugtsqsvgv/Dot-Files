import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import Quickshell.Bluetooth 
import Quickshell.Hyprland


import qs.components
import qs.services

import "root:/"

InnerContainer{

    id : root

    width: bIcon.implicitWidth + 100
    height: Config.barHeight

    

    CustomTextIcon{
        id:bIcon

        anchors.left:parent.left
        anchors.leftMargin: 8

                text: BluetoothService.icon
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{Hyprland.dispatch("hl.dsp.exec_cmd('qs ipc call bluetoothCenter toggle')")}
            }

}

