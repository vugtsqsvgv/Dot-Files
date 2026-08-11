pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications 
import Quickshell.Io
import qs.components

import 'root:/'


Singleton{

    id : root
    property var trackedNotifications : server.trackedNotifications
    property var history : history

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

    
}