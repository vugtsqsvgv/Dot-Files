import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire
import Quickshell.Networking
import Quickshell.Io

import "root:/"

import qs.components
import qs.services

Scope {
    id: root

    IpcHandler {

        target: "networkingWindow"

        function toggle(): void {
            networkingWindow.visible = !networkingWindow.visible;
        }
    }

    PanelWindow {
        id: networkingWindow

        color: "transparent"

        implicitWidth: 600
        implicitHeight: 300

        anchors {
            top: true
            right: true
        }

        margins {
            top: Config.barHeight
            right: 36
        }

        visible: false

        Container {
            anchors.fill: parent

            ColumnLayout {

                spacing: 16

                Repeater {

                    model: NetworkService.wifiNetworks

                    Container {

                        height: 64
                        width: wifi.implicitWidth + 8

                        required property var modelData

                        RowLayout {
                            id: wifi
                            anchors.fill: parent
                            anchors.margins: 8

                            CustomText {
                                text: modelData.name
                            }

                            CustomText {
                                text: {
                                    if (modelData.state === ConnectionState.Connected)
                                        return "connected";
                                    return "disconnected";
                                }

                                color: "#3d95e7"
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                modelData.connect();
                            }
                        }
                    }
                }
            }
        }
    }
}
