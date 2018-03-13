import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import Qt.labs.platform 1.0
import Awesome 1.0

ToolBar {
    property var toolBarConfig: appWindow.currentPage ? appWindow.currentPage.toolBarConfig : {}

    width: parent.width

    RowLayout {
        anchors.fill: parent

        AwesomeToolButton {
            id: toolButton1
            text: toolBarConfig && toolBarConfig.toolButton1 ? FontAwesome.icons[toolBarConfig.toolButton1.icon] : FontAwesome.icons["bars"]
            onClicked: {toolBarConfig && toolBarConfig.toolButton1 ? toolBarConfig.toolButton1.action() :  appWindow.eventNotified("openDrawer", {})}
        }

        AwesomeToolButton {
            id: toolButton2
            text: toolBarConfig && toolBarConfig.toolButton2 && Object.keys(toolBarConfig.toolButton2).length > 0 ? FontAwesome.icons[toolBarConfig.toolButton2.icon] : ""
            onClicked: {
              if (toolBarConfig && toolBarConfig.toolButton2 && Object.keys(toolBarConfig.toolButton2).length > 0)
                toolBarConfig.toolButton2.action()
            }
        }

        Label {
            text: toolBarConfig && toolBarConfig.label ? toolBarConfig.label.text : ""
            font.bold: toolBarConfig && toolBarConfig.label ? toolBarConfig.label.bold: false
            color: toolBarConfig && toolBarConfig.label ? toolBarConfig.label.color : "white"
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }

        AwesomeToolButton {
            id: toolButton3
            text: toolBarConfig && toolBarConfig.toolButton3 && Object.keys(toolBarConfig.toolButton3).length > 0 ? FontAwesome.icons[toolBarConfig.toolButton3.icon] : ""
            onClicked: {toolBarConfig && toolBarConfig.toolButton3 && Object.keys(toolBarConfig.toolButton3).length > 0 ? toolBarConfig.toolButton3.action() : "" }
        }

        AwesomeToolButton {
            id: toolButton4
            text: toolBarConfig && toolBarConfig.toolButton4 && Object.keys(toolBarConfig.toolButton4).length > 0 ? FontAwesome.icons[toolBarConfig.toolButton4.icon] : ""
            onClicked: {toolBarConfig && toolBarConfig.toolButton4 && Object.keys(toolBarConfig.toolButton4).length > 0 ? toolBarConfig.toolButton4.action() : "" }
        }
    }
}
