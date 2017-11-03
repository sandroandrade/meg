import QtQuick 2.7
import QtQuick.Controls 2.1

import "FontAwesome.js" as FA

StackView {
    property alias model: listView.model
    property string itensPage
    property string itemHead
    property string icon

    id: stackView

    initialItem: ListView {
        id: listView
        delegate: ItemDelegate {
            text: "         " + modelData[itemHead]
            width: parent.width
            
            AwesomeToolButton {
                text: FA.icons[icon]
                enabled: false
            }
            onClicked: stackView.push(itensPage, { "model": stackView.model[index], "stackView": stackView })
        }
    }
}
