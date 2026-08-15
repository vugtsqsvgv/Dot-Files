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
    id: root

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
            repeat : false
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