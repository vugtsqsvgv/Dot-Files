import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import qs.components

import 'root:/'


Scope{

    id : root

    ListModel{
            id: history
        }

    NotificationServer{
        id: server
        actionsSupported : true
        bodySupported : true
        imageSupported : true

        onNotification : n =>{
            history.insert(0,{
                summary: n.summary,
                body: n.body,
                appName: n.appName,
                urgency: n.urgency,
                time: Qt.formatDateTime(new Date(), "HH:mm")
            })
            n.tracked = true
        }
    }

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
        top: Config.barHeight + 16*2
        right: (Config.barHeight + 16*2)/2 
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
                onClicked:{history.clear()}
            }
        }

    }


    Repeater{
        model:history

                    Rectangle{
                id: pastCard

                required property var modelData 

                Layout.alignment : Qt.AlignTop
                Layout.fillWidth : true
                Layout.preferredHeight : 100
                radius : 16
                color : "#121212"
                border{
                    width : 4
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

                        Text{
                        text: modelData.body
                        color: "gray"
                        font{
                            family: "JetBrainsMono Nerd Fond Mono"
                            pixelSize: 16
                            weight : 400
                        }
                        }

                    
                }


        }
        MouseArea{
            anchors.fill:parent
            onClicked:{history.remove(modelData.index,1)}
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
        top: 24
        right: 24
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
            model: server.trackedNotifications

            Rectangle{
                id: card

                required property var modelData 

                Layout.fillWidth : true
                Layout.preferredHeight : 100
                radius : 16
                color : "#121212"
                border{
                    width : 4
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

                        Text{
                        text: modelData.body
                        color: "gray"
                        font{
                            family: "JetBrainsMono Nerd Fond Mono"
                            pixelSize: 16
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