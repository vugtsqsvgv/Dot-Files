pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray

Singleton{

    id : time 

    readonly property string time : Qt.formatDateTime(clock.date,"hh:mm")

    SystemClock{
            id: clock
            precision: SystemClock.Minutes
        }

}