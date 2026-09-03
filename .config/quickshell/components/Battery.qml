import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.UPower
import qs.components
import qs.services

import "root:/"


Container{


    id: root

    height : Config.barHeight
    implicitWidth: layout.implicitWidth + 16
    
    border {
        width : 4
        color : {
          if (BatteryService.charging) return "#3d95e7"
          if (BatteryService.level <=10 ) return "#d65434" 
          if (BatteryService.level <= 30) return "#dfae33" 
          if (BatteryService.level <= 70) return "#8de82d"
          return  "#23f183"
        }

    }
    


    RowLayout{

        id : layout

        uniformCellSizes : true

        anchors.fill : parent
        anchors.leftMargin : 8
        anchors.rightMargin : 8

        spacing : 2

        CustomTextIcon{
            text : BatteryService.icon
            color : {
          if (BatteryService.charging) return "#3d95e7"
          if (BatteryService.level <=10 ) return "#d65434" 
          if (BatteryService.level <= 30) return "#dfae33" 
          if (BatteryService.level <= 70) return "#8de82d"
          return  "#23f183"
        }


        }

        CustomText{
            text : BatteryService.level + "%"
        }
    }
}
