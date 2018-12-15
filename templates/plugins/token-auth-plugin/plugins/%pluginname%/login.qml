import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import Components 1.0 as Components

Item {
    property bool showError: false

    width: appWindow.width

    Components.JSONListModel {
        id: authTokenJsonListModel
        source: internal.baseServer + "/api/token"
        requestMethod: "GET"
        additionalHeaders: [{"key": "Authorization", "value": "Basic " + Qt.btoa(login.text + ":" + password.text)}]
        onStateChanged: {
            if (state === "ready" && httpStatus == 200) {
                settings.base64StringOfUserColonPassword = Qt.btoa(login.text + ":" + password.text)
                settings.authToken = authTokenJsonListModel.json["token"]
                loginJsonListModel.load()
            } else if (state === "error") {
                showError = true
            }
        }
    }

    Components.JSONListModel {
        id: loginJsonListModel
        source: internal.baseServer + "/login"
        requestMethod: "GET"
        additionalHeaders: [{"key": "Authorization", "value": "Token " + settings.authToken}]
        onStateChanged: {
            if (state === "ready" && httpStatus == 200) {
                appWindow.login()                
            } else if (state === "error" && httpStatus == 401) {
                authTokenJsonListModel.load()
            } else if (state === "error") {
                showError = true
            }
        }
    }

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
            echoMode: TextInput.Password
        }

        Button {
            id: proccessButton
            Layout.fillWidth: true
            text: "Logar"
            onClicked: {
                toast.show("Logging ...")
                if (settings.authToken)
                    loginJsonListModel.load()
                else
                    authTokenJsonListModel.load()
            }
        }

        Label {
            id: errorLabel
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            text: "Invalid Login or password."
            color: "red"
            visible: showError
        }

        BusyIndicator {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.maximumWidth: parent * 0.3
            running: loginJsonListModel.state === "loading" || authTokenJsonListModel.state === "loading"
        }        
    }
}
