import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import qs.components

import 'root:/'

Scope{
    id:root

IpcHandler{
    target: "centerWindow"

    function toggle () : void { centerWindow.openCenter =! centerWindow.openCenter }
}

    PanelWindow{


        id:centerWindow

        property bool openCenter : false


        visible: centerWindow.openCenter

        exclusionMode: ExclusionMode.Ignore

        anchors{
            top:true
            right:true

        }

        margins{
            top: Config.barHeight+32
            right: (Config.barHeight+32)/2

        }

        implicitWidth: 300
        implicitHeight: 300

        color: "transparent"

        StackView{
            id:stackView
            initialItem: initialview
            anchors.fill:parent
        }

        Container{
            id: initialview
            anchors.fill: parent

            RowLayout{
                anchors.fill: parent
                anchors.margins:8

            Bluetooth{}
            Notifications{}

            }

        }

    }
}