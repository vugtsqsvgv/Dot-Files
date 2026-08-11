import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland   

import qs.services
import qs.components

import "root:/"
            
            
            
            Container{

                id: root


            width : time.implicitWidth + 16
            height: Config.barHeight
            
            CustomText{

                id : time
            anchors.centerIn : parent
            text : Time.time
                }

        }
        