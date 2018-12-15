import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    width: parent.width * 0.75; height: parent.height
    visible: true

    property alias searchText: __searchInput.text

    TextField {
        id: __searchInput
        focus: parent.visible
        width: parent.width
        placeholderText: qsTr(" tap to search...")
        selectionColor: Qt.rgba(25,25,25,0.2)
        selectedTextColor: Qt.rgba(25,25,25,0.8)
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        onVisibleChanged: {
            text = ""
            if (visible)
                forceActiveFocus()
        }
    }
}
