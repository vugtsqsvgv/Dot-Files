import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Hyprland
import Quickshell.Io
import qs.components

import "root:/"

Container{
    implicitWidth: icon.implicitWidth+32
    height: Config.barHeight

    CustomTextIcon{
        id : icon 
        anchors.centerIn: parent
        text : String.fromCodePoint(0xf08c7)
    }

    MouseArea{
        anchors.fill: parent
        onClicked:{Hyprland.dispatch("hl.dsp.exec_cmd('qs ipc call centerWindow toggle')")}
    }
     
}