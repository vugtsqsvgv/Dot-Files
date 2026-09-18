import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell.Io
import qs.components
import qs.windows
import qs.services

import "root:/"

Scope {
    id: root

    IpcHandler {
        target: "centerWindow"

        function toggle(): void {
            centerWindow.openCenter = !centerWindow.openCenter;
        }
    }

    PanelWindow {
        id: centerWindow

        property bool openCenter: false

        visible: centerWindow.openCenter

        exclusionMode: ExclusionMode.Ignore

        anchors {
            top: true
            right: true
        }

        margins {
            top: Config.barHeight + 32
            right: (Config.barHeight + 32) / 2
        }

        implicitWidth: 500
        implicitHeight: 600

        color: "transparent"

        Container {
            anchors.fill: parent

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8

                InnerContainer {
                    Layout.alignment: Qt.AlignTop
                    width: 64
                    height: 24
                    CustomTextIcon {
                        anchors.centerIn: parent
                        text: String.fromCodePoint(0xf030d)
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            stackView.pop();
                        }
                    }
                }

                StackView {
                    id: stackView
                    initialItem: initialview
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
    Component {
        id: initialview

        RowLayout {
            anchors.fill: parent
            anchors.margins: 8

            Bluetooth {
                onClicked: {
                    stackView.push(bluetoothWindow);
                }
            }
            Notifications {
                onClicked: {
                    stackView.push(notificationWindow);
                }
            }

            Grayscale {}
        }
    }

    Component {
        id: bluetoothWindow
        BluetoothWindow {}
    }

    Component {
        id: notificationWindow
        NotificationWindow {}
    }
}
