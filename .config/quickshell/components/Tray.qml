import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 
import Quickshell.Networking 
import Quickshell.Services.SystemTray

import qs.services
import qs.components

import 'root:/'

Container{

    id:root

    height : Config.barHeight
    width : row.implicitWidth + 16

    color : "transparent"

    RowLayout{
        id : row

        anchors.fill : parent
        anchors.leftMargin : 8
        anchors.rightMargin : 8

    Repeater{
        model : TrayService.trayItems

            Image{
                id:item

                required property var modelData 

                source: item.modelData.icon
                Layout.preferredWidth : 20
                Layout.preferredHeight : 20

                MouseArea{
                    anchors.fill:parent
                    onClicked:{modelData.activate()}
                }

            }


        }

        }

    }

