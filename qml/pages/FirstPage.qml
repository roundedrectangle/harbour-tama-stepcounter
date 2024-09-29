import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show tutorial")
                onClicked: pageStack.push(Qt.resolvedUrl("TutorialPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: version == '' ? '' : qsTr("Version: ") + version
            }
            Label {
                x: Theme.horizontalPageMargin
                text: stepCount == -1 ? '' : qsTr("Step count: ") + stepCount
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            ButtonLayout {
                Button {
                    text: qsTr("Reset")
                    onClicked: resetSteps()
                }
                Button {
                    text: qsTr("Reload")
                    onClicked: getSteps()
                }
            }
        }
    }
}
