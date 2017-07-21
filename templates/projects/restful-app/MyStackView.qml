import QtQuick 2.7
import QtQuick.Controls 2.1

StackView {
    property alias model: listView.model
    property string itensPage
    property string itemHead

    id: stackView

    initialItem: ListView {
        id: listView
        delegate: Row {
            width: parent.width
            leftPadding: 10
            Image {
                width: delegate.height/2; height: delegate.height
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "file:icons/" + contents[internal.selectedPluginIndex].icon + "_black.png"
            }
            ItemDelegate {
                id: delegate
                text: modelData[itemHead]
                width: parent.width
                onClicked: stackView.push(itensPage, { "model": stackView.model[index], "stackView": stackView })
            }
        }
    }
}
