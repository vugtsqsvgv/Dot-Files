pragma Singleton

import Quickshell
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.SystemTray
import Quickshell.Services.Pipewire 

import 'root:/'


Singleton{
    id : root

    readonly property var sink : Pipewire.defaultAudioSink
    readonly property bool ready : sink && sink.ready
    readonly property bool muted : ready && sink.audio.muted
    readonly property int vol : ready ? Math.round(sink.audio.volume * 100) : 0
    readonly property string icon : {
        if (!ready) return String.fromCodePoint(0xeee8)
        if (muted || vol === 0 ) return String.fromCodePoint(0xf026)
        
        if ( vol < 50 ) return String.fromCodePoint(0xf027)
        if ( vol < 75 ) return String.fromCodePoint(0xefcf)
        return String.fromCodePoint(0xf028)
    }

    function changeVol (value:real) : void {root.sink.audio.volume = (value/100)}

    PwObjectTracker{
        objects : [root.sink]
    }

}