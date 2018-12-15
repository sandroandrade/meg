import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import Components 1.0

Item {    
    width: appWindow.width
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 3
        spacing: 3

        TextField {
            id: login
            Layout.fillWidth: true
            placeholderText: "Username"
        }

        TextField {
            id: password
            Layout.fillWidth: true
            placeholderText: "Password"
            echoMode: TextInput.PasswordEchoOnEdit
        }

        Button {
            id: proccessButton
            Layout.fillWidth: true
            text: "Logar"
            onClicked: {
                loginJsonListModel.load()
            }
        }

        Label {
            id: data
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            text: "Invalid Login or password."
            color: "red"
            visible: loginJsonListModel.state === "error"
        }

        BusyIndicator {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.maximumWidth: parent * 0.3
            running: loginJsonListModel.state === "loading"
        }

        JSONListModel {
            id: loginJsonListModel
            source: internal.baseServer + "/login"
            requestMethod: "GET"
            additionalHeaders: [{"key": "Authorization", "value": "Basic " + Qt.btoa(login.text + ":" + password.text)}]
            onStateChanged: {
                if (state === "ready" && httpStatus == 200) {
                    appWindow.login({"authHeader": {"key": "Authorization", "value": "Basic " + Qt.btoa(login.text + ":" + password.text)}})
                }
            }
        }

    }
}
