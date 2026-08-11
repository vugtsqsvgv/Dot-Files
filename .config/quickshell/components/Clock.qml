import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland   

import qs.services

import "root:/"
            
            
            
            Rectangle{

                id: root


            width : time.implicitWidth + 16
            height: Config.barHeight
            color: "#121212"
            radius: 16
            border{
                width : 4
                color: "#2B2B2B"
            }

            Text{

                id : time

            color : "white"
            font.weight : 500
            font.pixelSize : 16
            font.family : "JetBrainsMono Nerd Font Mono"
            anchors.centerIn : parent
            text : Time.time
                }

        }
        