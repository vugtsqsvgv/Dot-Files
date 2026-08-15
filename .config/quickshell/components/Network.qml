import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 
import Quickshell.Networking 

import qs.services
import qs.components

import 'root:/'

Container{

    id : root

    implicitWidth: layout.implicitWidth + 16
    height: Config.barHeight

    RowLayout{

        id: layout

        anchors.fill : parent
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        CustomTextIcon{
            id: icon
            text: NetworkService.icon
        }

        CustomText{
            id: nName
            text: NetworkService.networkName
        }

    }



}