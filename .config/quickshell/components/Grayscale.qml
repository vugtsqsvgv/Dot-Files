import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell.Hyprland
import Quickshell.Io
import qs.components

import "root:/"

InnerContainer {
    id: root

    height: Config.barHeight
    implicitWidth: color.implicitWidth + 100

    property bool isgray: false

    RowLayout {

        CustomTextIcon {
            id: color
            text: String.fromCodePoint(0xeac6)
        }

        CustomText {

            text: {
                if (root.isgray)
                    return "ON";
                return "OFF";
            }
        }
    }

    MouseArea {

        anchors.fill: parent
        onClicked: {
            root.isgray = !root.isgray;
            if (root.isgray) {
                Hyprland.dispatch("hl.dsp.exec_cmd('hyprshade on grayscale')");
            } else {
                Hyprland.dispatch("hl.dsp.exec_cmd('hyprshade off')");
            }
        }
    }
}
