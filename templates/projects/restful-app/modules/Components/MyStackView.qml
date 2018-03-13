import QtQuick 2.7
import QtQuick.Controls 2.1
import Awesome 1.0

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
                text: FontAwesome.icons[stackView.icon]
                enabled: false
            }
            onClicked: {
                stackView.push(itensPage, { "model": stackView.model[index], "stackView": stackView, "state": "details" })
            }
        }
    }

    Component.onCompleted: {        
        stacks.push(stackView)
        stacks = stacks
    }
}
