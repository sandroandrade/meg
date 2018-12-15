import QtQuick 2.3
import QtQuick.Controls 2.2

Item {
    Column {
        id: actionColumn
        anchors.centerIn: parent
        spacing: 50;

        Label {
            text: qsTr("Are sure you want to quit the app?")
            color: "black"
            font { pointSize: 16; bold: true }
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: qsTr("Yes! exit now")
            onClicked: appWindow.logout()
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: qsTr("No! get back")
            onClicked: mainStack.pop()
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
