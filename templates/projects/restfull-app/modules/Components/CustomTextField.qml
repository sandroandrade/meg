import QtQuick 2.7
import QtQuick.Controls 2.1

Item {
    id: item
    height: childrenRect.height

    property bool readOnly
    property string text
    property string value: textField.text

    TextField {
        id: textField
        text: item.text
        width: parent.width
        readOnly: item.readOnly
    }
}
