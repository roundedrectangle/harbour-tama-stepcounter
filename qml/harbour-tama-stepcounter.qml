import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import Nemo.DBus 2.0

ApplicationWindow {
    property int stepCount: -1
    property string version: ''

    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    function errorCallback(e) {
        if (e === "org.freedesktop.DBus.Error.ServiceUnknown" && stepUpdater.running) {
            stepUpdater.stop()
            pageStack.push("pages/TutorialPage.qml", {backNavigation: false})
        }
    }

    function getSteps() { stpcntrd.typedCall('getSteps', [], function(value) { stepCount = value }, errorCallback) }
    function resetSteps() { stpcntrd.call('resetStoredSteps') }
    function getVersion() { stpcntrd.typedCall('getVersion', [], function(ver) { version = ver }, errorCallback) }

    function reload() { getSteps(); getVersion() }

    Timer {
        id: stepUpdater
        interval: 2500
        onTriggered: getSteps()
        running: true
        repeat: true
    }

    DBusInterface {
         id: stpcntrd

         service: 'com.kimmoli.stpcntrd'
         iface: 'com.kimmoli.stpcntrd'
         path: '/'

         signalsEnabled: true

         function steps(value) { stepCount = value } // doesnt work for some reason

         Component.onCompleted: reload()
     }
}
