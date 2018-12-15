import QtQuick 2.7

Item {
    id: rootItem

    property string source
    property string requestMethod: "GET"
    property var requestObject
    property string errorString: ""
    property int httpStatus: 0
    property var additionalHeaders: []

    property var json
    property QtObject model

    onJsonChanged: updateJSONModel()

    state: "null"
    states: [
          State { name: "null" },
          State { name: "ready" },
          State { name: "loading" },
          State { name: "error" }
    ]

    function load() {
        var xhr = new XMLHttpRequest;        
        xhr.open(requestMethod, source);
        xhr.setRequestHeader('Content-type', 'application/json');

        var size = rootItem.additionalHeaders ? rootItem.additionalHeaders.length : 0;
        for (var i=0; i<size;i++) {
           xhr.setRequestHeader(rootItem.additionalHeaders[i].key, rootItem.additionalHeaders[i].value);
        }
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
        xhr.send(JSON.stringify(requestObject)); // requestParams ignored if requestMethod equals GET
    }

    function updateJSONModel() {
        if (!json || !model)
            return;

        model.clearAll();

        var objectArray = json
        for ( var key in objectArray ) {
            var jo = objectArray[key];
            model.addData(jo);
        }
    }
}
