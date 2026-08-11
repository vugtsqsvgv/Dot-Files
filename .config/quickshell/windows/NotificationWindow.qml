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

    IpcHandler{
        target: "notificationCenter"
        function toggle () : void { notificationCenter.centerOpen =! notificationCenter.centerOpen }
        function visible () : void { notificationCenter.centerOpen = true }
        function hide () : void { notificationCenter.centerOpen = false }

    }

// notification center

    PanelWindow {

        id: notificationCenter

        property bool centerOpen : false


        visible : notificationCenter.centerOpen

    anchors{
        top:true
        right: true
    }

    margins{
        top: Config.barHeight + 16
        right: (Config.barHeight + 16)/2 
    }

    color : "transparent"

    implicitWidth  : 400
    implicitHeight : 400

    exclusionMode : ExclusionMode.Ignore

    Container{

        anchors.fill : parent

        ColumnLayout{

            anchors{
                fill : parent
                margins : 16
            }


    

    RowLayout{
        Layout.alignment : Qt.AlignTop
        Layout.fillWidth : true
        Layout.fillHeight:true
        CustomText{
            Layout.alignment : Qt.AlignLeft
            text: "Notifications"
        }

        Rectangle{

            Layout.alignment : Qt.AlignRight

            id:clearButton

            height: clearText.implicitHeight + 16
            width: clearText.implicitWidth + 16

            color: Config.bg1

            radius : 16

            CustomText{

                anchors.centerIn: parent

                id: clearText
                text: "Clear All"
            }

            MouseArea{
                anchors.fill: parent
                onClicked:{NotificationService.history.clear()}
            }
        }

    }


    Repeater{
        model:NotificationService.history

                    Container{
                id: pastCard

                required property var modelData 

                Layout.alignment : Qt.AlignTop
                Layout.fillWidth : true
                Layout.preferredHeight : 100
                border{
                    color : modelData.urgency === NotificationUrgency.Critical ? Config.red : Config.bg1
                }

                RowLayout{
                    anchors.margins: 16
                    anchors.fill : parent
                    spacing : 8
                    
                    ColumnLayout{

                        spacing : 18

                        CustomText{
                        text: modelData.summary
                        font{
                            pixelSize: 18
                            weight : 800
                        }
                        }

                        CustomText{
                        text: modelData.body
                        color: "gray"
                        font{
                            weight : 400
                        }
                        }

                    
                }


        }
        MouseArea{
            anchors.fill:parent
            onClicked:{NotificationService.history.remove(modelData.index,1)}
        }

    }

    }

        }



    }


// floating notifications

    PanelWindow {
    anchors{
        top:true
        right: true
    }

    margins{
        top: Config.barHeight + 16
        right: (Config.barHeight + 16 )/ 2
    }

    color : "transparent"

    implicitWidth  : 300
    implicitHeight : cardContiner.implicitHeight

    exclusionMode : ExclusionMode.Ignore

    ColumnLayout{
        id: cardContiner
        anchors.fill : parent
        spacing : 8
        uniformCellSizes: true

        Repeater{
            model: NotificationService.trackedNotifications

            Container{
                id: card

                required property var modelData 

                Layout.fillWidth : true
                Layout.preferredHeight : 100
                border{
                    color : modelData.urgency === NotificationUrgency.Critical ? Config.red : Config.bg1
                }

                RowLayout{
                    anchors.margins: 16
                    anchors.fill : parent
                    spacing : 8
                    Image{

                        visible : modelData.image !== ""

                        source: modelData.image
                        Layout.preferredHeight : 24
                        Layout.preferredWidth : 24
                        }

                    ColumnLayout{

                        spacing : 18

                        CustomText{
                        text: modelData.summary
                        font{
                            pixelSize: 18
                            weight : 800
                        }
                        }

                        CustomText{
                        text: modelData.body
                        color: "gray"
                        font{
                            weight : 400
                        }
                        }
                }
        }

        Timer{
            interval: 5000
            running : modelData.urgency !== NotificationUrgency.Critical
            onTriggered : {modelData.expire()}

        }

        MouseArea{
            anchors.fill:parent
            onClicked:{modelData.dismiss()}
        }

    }

}

}

}
}


}

