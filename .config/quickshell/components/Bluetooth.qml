import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import Quickshell.Bluetooth 
import Quickshell.Hyprland


import qs.components

import "root:/"

InnerContainer{

    id : root

    width: bIcon.implicitWidth + 100
    height: Config.barHeight

    property var adapter : Bluetooth.defaultAdapter
    property bool enabled : adapter ? adapter.state === BluetoothAdapterState.Enabled : false


    property string icon : {
        if (enabled) return String.fromCodePoint(0xf294)
        return String.fromCodePoint(0xf00b2)
    }

    CustomTextIcon{
        id:bIcon

        anchors.left:parent.left
        anchors.leftMargin: 8

                text: root.icon
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{Hyprland.dispatch("hl.dsp.exec_cmd('qs ipc call bluetoothCenter toggle')")}
            }

}

