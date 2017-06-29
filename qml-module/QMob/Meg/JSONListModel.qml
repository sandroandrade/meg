import QtQuick 2.7

Item {
    id: rootItem

    property string source
    property string requestMethod: "GET"
    property string requestParams
    property ListModel model: ListModel { id: listModel }
    property alias count: listModel.count
    property string errorString: ""
    property int httpStatus

    QtObject {
        id: privateProperties
        property string json: ""
        onJsonChanged: updateJSONModel()
    }

    state: "null"
    states: [
          State { name: "null" },
          State { name: "ready"},
          State { name: "loading"},
          State { name: "error"}
    ]

    function load() {
        var xhr = new XMLHttpRequest;
        xhr.open(requestMethod, (requestMethod === "GET") ? source + "?" + requestParams : source);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onerror = function() {
            rootItem.errorString = qsTr("Cannot connect to server!");
            rootItem.state = "error";
        }
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                rootItem.httpStatus = xhr.status;
                if (rootItem.httpStatus >= 200 && rootItem.httpStatus <= 299) {
                    privateProperties.json = xhr.responseText;
                }
                else {
                    rootItem.errorString = qsTr("The server returned error ") + xhr.status;
                    rootItem.state = "error";
                }
            }
        }
        xhr.send(requestParams); // requestParams ignored if requestMethod equals GET
        rootItem.errorString = ""
        rootItem.state = "loading";
    }

    function updateJSONModel() {
        listModel.clear();

        if (privateProperties.json === "") {
            rootItem.errorString = qsTr("The server returned an empty response!");
            rootItem.state = "error";
            return;
        }

        var objectArray = JSON.parse(privateProperties.json);
        for (var key in objectArray) {
            var jo = objectArray[key];
            listModel.append(jo);
        }

        rootItem.state = "ready";
    }
}
