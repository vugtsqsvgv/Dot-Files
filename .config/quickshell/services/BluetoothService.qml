import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import Quickshell.Bluetooth 

import qs.components

import "root:/"


Scope{

    id : root

    property var adapter : Bluetooth.defaultAdapter
    property bool enabled : adapter ? adapter.state === BluetoothAdapterState.Enabled : false
    property var devices : adapter ? adapter.devices : null

    IpcHandler{
        target: "bluetoothCenter"
        function toggle () : void { bluetoothCenter.centerOpen =! bluetoothCenter.centerOpen }
        function visible () : void { bluetoothCenter.centerOpen = true }
        function hide () : void { bluetoothCenter.centerOpen = false }

    }

    PanelWindow{

        id : bluetoothCenter

        property bool centerOpen : false


       visible: bluetoothCenter.centerOpen


        anchors{
            top: true
            right: true
            }

        margins{
            top: 24
            right: 24
        }

        implicitWidth: 300
        implicitHeight: 300

        color: "transparent"

        Container{
            width:300
            height: 300

            RowLayout{

            id:layout

            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8

            spacing : 8

            Repeater {

            model : root.devices

            Container{

                required property var modelData

                Layout.fillWidth: true

                RowLayout{
                    anchors.fill : parent


                    Image{
                        source: (Quickshell.iconPath(modelData.icon,true))
                    }
                    


                    ColumnLayout{
                        Layout.alignment : Qt.AlignTop
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        CustomText{

                    text: modelData.name


                }

                    CustomText{

                    text: toString(modelData.state)


                }


                    }
                }
                height: 72
            }



        }

    }

        }

        

    }

}

        

