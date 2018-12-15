import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

ToolButton {
    id: control    
    font { family: fontAwesome.name; pointSize: 14 }
    contentItem: Text {
        text: control.text
        font: control.font
        color: enabled ? "#ffffff":Material.primary
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
