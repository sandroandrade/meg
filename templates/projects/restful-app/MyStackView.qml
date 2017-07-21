import QtQuick 2.7
import QtQuick.Controls 2.1

StackView {
    property alias model: listView.model
    property string itensPage
    property string itemHead

    id: stackView

    initialItem: ListView {
        id: listView
        delegate: ItemDelegate {
            text: modelData[itemHead]
            width: parent.width
            onClicked: stackView.push(itensPage, { "model": stackView.model[index], "stackView": stackView })
        }
    }
}
