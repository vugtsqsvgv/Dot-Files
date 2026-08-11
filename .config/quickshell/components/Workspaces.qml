import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.components

import "root:/"

RowLayout{

    id : root

    property int workspaces : 5
    property int workspaceActiveWidth : 64
    property int margins : 8

Container{

    

                height : Config.barHeight
                width : ((root.workspaceActiveWidth * root.workspaces) + (root.workspaces * (margins + 1)))

            RowLayout{
                anchors.fill : parent
                anchors.leftMargin : root.margins
                anchors.rightMargin : root.margins
                spacing : root.margins
                

                Repeater{
            model: root.workspaces

            Item{

                Layout.minimumWidth : 64

            Rectangle{

                id : workspace


                property bool isActive : Hyprland.focusedWorkspace?.id === (index + 1)

                color : {
                    if (isActive) return Config.bg1
                    return Config.bg0
                }
                height: 24
                implicitWidth : isActive ? root.workspaceActiveWidth : (root.workspaceActiveWidth / 2)
                radius: 16
                anchors.centerIn: parent
                


                Behavior on color{

                    ColorAnimation{ duration : 1000 }

                }


                Text{
                
                
                anchors.centerIn : parent
                text : index + 1
                color : "white"
                font{
                    pixelSize : 16
                    weight : 500
                    family : "JetBrainsMono Nerd Font Mono"

                }


            }

            }
                }

         }


            }
        }

    Rectangle{

            visible : Hyprland.focusedWorkspace?.id > 5

                color : "#2B2B2B"
                height : 32
                width : 32
                radius : 16

            Rectangle{

                anchors.centerIn : parent
                color : "#121212"
                height : 24
                width : 24
                radius : 16

            }

        }

}