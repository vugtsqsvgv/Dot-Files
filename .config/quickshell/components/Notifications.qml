import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Hyprland
import Quickshell.Io
import qs.components

import "root:/"

InnerContainer{

    id: root

    height: Config.barHeight
    implicitWidth: bell.implicitWidth + 100

    signal clicked()

    CustomTextIcon{
        id :bell
        anchors.left:parent.left
        anchors.leftMargin: 8


        text: String.fromCodePoint(0xf0f3)

    }

    MouseArea{

        anchors.fill : parent
        onClicked:{root.onClicked()}

    }

}