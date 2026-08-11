pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 
import Quickshell.Networking 
import Quickshell.Services.SystemTray

import qs.services
import qs.components

import 'root:/'

Singleton{
    id: root
    property var trayItems : SystemTray.items
}