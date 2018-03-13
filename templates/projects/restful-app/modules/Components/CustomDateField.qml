import QtQuick 2.7
import QtQuick.Controls 2.2

Item {
    id: item
    height: childrenRect.height

    property bool readOnly
    property string text
    property string value: "{0}/{1}/{2}".replace("{0}", daysTumbler.currentIndex + 1).replace("{1}", monthsTumbler.currentIndex + 1).replace("{2}", yearTumbler.currentItem.text)
    property var dateField

    Rectangle {
        width: row.width
        height: row.height
        border.color: "transparent"
        color: "transparent"
        border.width: 1
        radius: 2

        Row {
            id: row

            Tumbler {
                id: daysTumbler
                model: 31
                height: 100
                currentIndex: item.dateField.getDate() - 1
                enabled: !item.readOnly                
                delegate:  Label {
                    text: modelData + 1
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Tumbler {
                id: monthsTumbler
                model: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
                height: 100
                currentIndex: item.dateField.getMonth()
                enabled: !item.readOnly
                delegate:  Label {
                    text: modelData
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Tumbler {
                id: yearTumbler
                model: 9999
                height: 100
                currentIndex: item.dateField.getFullYear()
                enabled: !item.readOnly
                delegate:  Label {
                    text: modelData
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }
    Component.onCompleted: {
        if (text && text !== '') {
            var from = text.split("/");
            var jsDate = new Date(from[2], from[1] - 1, from[0]);
            item.dateField = jsDate;
        } else {            
            item.dateField = new Date();
        }
    }
}
