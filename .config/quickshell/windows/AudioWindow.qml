import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import qs.components
import qs.services

import 'root:/'

Scope{

    id:root

    IpcHandler{
        target: "audioCenter"

        function toggle() : void {audioCenter.centerOpen =! audioCenter.centerOpen}
    }

    PanelWindow{

        id: audioCenter

        property bool centerOpen : false

        visible: audioCenter.centerOpen

        anchors{
            top:true
            left: true
        }

        margins{
            top: Config.barHeight + 16
            left: (Config.barHeight + 16)/2
        }

        implicitHeight: 64
        implicitWidth: 100

        color:"transparent"

        Container{

    anchors.fill : parent

    ColumnLayout{

        anchors.fill : parent
        anchors.margins:8

        Slider {
    id: control
    from: 0
    to: 100
    value : AudioService.vol
    Layout.fillWidth: true


        onMoved: AudioService.changeVol(value)

    

    background: InnerContainer {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 32
        width: control.availableWidth
        height: implicitHeight

        InnerContainer {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            width: control.visualPosition * parent.width
            height: (parent.height) / 1.5
            color: Config.bg0
        }
    }

    handle: InnerContainer {
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 26
        implicitHeight: 26
        color:"white"
    }

}


    }

}

    }

    

}

