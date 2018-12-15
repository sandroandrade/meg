import QtQuick 2.7
import QtQuick.Controls 2.1
import Awesome 1.0

ListView {
    model: listModel
    property string titleField
    property string awesomeIcon
    property var listModel
    property string detailPage
    property bool showEmptyLabel

    signal itemClicked(var dataIndex)

    Label {
        anchors.fill: parent
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        visible: showEmptyLabel && parent.count == 0
        text: qsTr("Nothing to show yet!")
        font.bold: true
    }

    delegate: ItemDelegate {
        text: "         " + modelData[titleField]
        width: parent.width

        AwesomeToolButton {
            text: FontAwesome.icons[awesomeIcon]
            enabled: false
        }
        onClicked: itemClicked(modelData)
    }
}

