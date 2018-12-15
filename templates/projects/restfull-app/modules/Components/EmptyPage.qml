import QtQuick 2.9
import QtQuick.Controls 2.2

Item {
    id: item
    
    property string toolBarState: "normal"
    property var topLeft: {"action": function(){ return appWindow.eventNotified("openDrawer", {}); }, "icon": "bars"}
    property string toolBarText: "Empty Page"
    property string pageName: "EmptyPage.qml"
    property string text

    Label {
        anchors.fill: parent
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        text: item.text
        font.bold: true
    }
}
