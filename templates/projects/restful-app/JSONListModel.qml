import QtQuick 2.7

Item {
    id: rootItem

    property string source
    property string requestMethod: "GET"
    property string requestParams
    property string errorString: ""
    property int httpStatus: 0

    property var json

    state: "null"
    states: [
          State { name: "null" },
          State { name: "ready" },
          State { name: "loading" },
          State { name: "error" }
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
            if (xhr.readyState === XMLHttpRequest.DONE) {
                rootItem.httpStatus = xhr.status;
                if (rootItem.httpStatus >= 200 && rootItem.httpStatus <= 299) {
                    json = JSON.parse(xhr.responseText);
                    rootItem.state = "ready";
                }
                else {
                    rootItem.errorString = qsTr("The server returned error ") + xhr.status;
                    rootItem.state = "error";
                }
            }
        }
        rootItem.errorString = ""
        rootItem.state = "loading";
        json = undefined
        xhr.send(requestParams); // requestParams ignored if requestMethod equals GET
    }
}
