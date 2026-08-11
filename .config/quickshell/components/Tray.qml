import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 
import Quickshell.Networking 
import Quickshell.Services.SystemTray

import 'root:/'

Rectangle{

    id:root

    height : Config.barHeight
    width : row.implicitWidth + 16

    color : "transparent"

    border{
        width: 4
        color: Config.bg1
    }

    radius : 15

    readonly property var trayItems : SystemTray.items

    RowLayout{
        id : row

        anchors.fill : parent
        anchors.leftMargin : 8
        anchors.rightMargin : 8

    Repeater{
        model : trayItems

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

