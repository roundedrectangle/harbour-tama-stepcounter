import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Tutorial")
            }

            Column {
                id: infoColumn
                width: parent.width - Theme.horizontalPageMargin*2
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: Theme.itemSizeLarge

                Column {
                    width: parent.width
                    Label {
                        width: parent.width
                        wrapMode: Text.Wrap
                        text: qsTr("Make sure this will only work on Sony Tama devices!")
                        font.pixelSize: Theme.fontSizeLarge
                        color: Theme.highlightColor
                    }

                    LinkedLabel {
                        width: parent.width
                        plainText: qsTr("Credit") + ": https://github.com/sailfishos-sony-tama/main#step-counter"
                        color: Theme.primaryColor
                        linkColor: Theme.secondaryHighlightColor
                    }
                }

                LinkedLabel {
                    width: parent.width
                    plainText:
                        qsTr("1. Enable developer mode in settings, and set a password for remote connection") +'\n'+
                        qsTr("2. Open Terminal app") +'\n'+
                        qsTr("3. Type devel-su pkcon install stpcntrd") +'\n'+
                        qsTr("3. Type password you set in settings and press enter when propmted") +'\n'+
                        qsTr("4. Type Y and press enter when prompred to confirm") +'\n'+
                        qsTr("5. Wait until it finishes and reopen the app. You can disable developer mode now")
                    color: Theme.primaryColor
                    linkColor: Theme.secondaryHighlightColor
                }

                Column {
                    width: parent.width

                    Label {
                        width: parent.width
                        wrapMode: Text.Wrap
                        color: Theme.highlightColor
                        font.pixelSize: Theme.fontSizeLarge
                        text: qsTr("Uninstalling")
                    }

                    LinkedLabel {
                        width: parent.width
                        plainText:
                            qsTr("1. Enable developer mode in settings, and set a password for remote connection") +'\n'+
                            qsTr("2. Open Terminal app") +'\n'+
                            qsTr("3. Type devel-su pkcon remove stpcntrd") +'\n'+
                            qsTr("3. Type password you set in settings and press enter when propmted") +'\n'+
                            qsTr("4. Type Y and press enter when prompred to confirm") +'\n'+
                            qsTr("5. Wait until it finishes. You can disable developer mode now")
                        color: Theme.primaryColor
                        linkColor: Theme.secondaryHighlightColor
                    }
                }

                Column {
                    width: parent.width
                    Label {
                        width: parent.width
                        wrapMode: Text.Wrap
                        color: Theme.highlightColor
                        font.pixelSize: Theme.fontSizeExtraLarge
                        text: qsTr("Troubleshooting")
                    }

                    LinkedLabel {
                        width: parent.width
                        plainText: qsTr("Try restarting your phone")
                        color: Theme.primaryColor
                        linkColor: Theme.secondaryHighlightColor
                    }
                }
            }
        }
    }
}
