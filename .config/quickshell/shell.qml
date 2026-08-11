import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import qs.components
import qs.services
import qs.windows 

import "root:/"

ShellRoot{

    id : root 

    PanelWindow{

        color : "transparent"

        anchors{
            top: true
            left: true
            right: true
        }
        implicitHeight: Config.barHeight

         margins.top : 16

        RowLayout{
            
            anchors{
                fill: parent
                leftMargin : 16
                rightMargin : 16
            }

//components
            Clock {}
            Workspaces {}
            Tray{}
            Audio{}
            Network{}
            Battery{}
            Center{}

//services

BluetoothWindow{}
NotificationWindow{}
CenterWindow{}
AudioWindow{}



        }
    }
}