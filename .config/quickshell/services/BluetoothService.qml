pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import Quickshell.Bluetooth 

import qs.components

import "root:/"


Singleton{

    id : root

    property var adapter : Bluetooth.defaultAdapter
    property bool enabled : adapter ? adapter.state === BluetoothAdapterState.Enabled : false
    property var devices : adapter ? adapter.devices : null

    property string icon : {
        if (enabled) return String.fromCodePoint(0xf294)
        return String.fromCodePoint(0xf00b2)
    }

    

}

        

