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

    implicitWidth: bIcon.implicitWidth + 100
    height: Config.barHeight

    signal clicked()

    

    CustomTextIcon{
        id:bIcon

        anchors.left:parent.left
        anchors.leftMargin: 8

                text: BluetoothService.icon
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{root.clicked()}
            }

}

