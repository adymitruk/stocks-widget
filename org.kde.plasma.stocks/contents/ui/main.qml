import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0
import QtQuick.XmlListModel 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: root

    property string symbol: plasmoid.configuration.symbol
    property string apiKey: plasmoid.configuration.apiKey
    property string price: "Loading..."
    property string message: ""

    Plasmoid.fullRepresentation: ColumnLayout {
        PlasmaComponents.Label {
            text: "Stock Price:"
        }
        PlasmaComponents.Label {
            text: root.price
            font.pointSize: 16
            font.bold: true
        }
        PlasmaComponents.Label {
            text: root.message
            visible: root.message !== ""
        }
    }

    function updateStockPrice() {
        if (!apiKey) {
            root.message = "API key not configured"
            root.price = "N/A"
            return
        }

        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText)
                    if (response.length > 0) {
                        root.price = "$" + response[0].price.toFixed(2)
                        root.message = ""
                    } else {
                        root.price = "N/A"
                        root.message = "No data available"
                    }
                } else {
                    root.price = "Error"
                    root.message = "Failed to fetch data"
                }
            }
        }
        xhr.open("GET", "https://financialmodelingprep.com/api/v3/quote-short/" + root.symbol + "?apikey=" + root.apiKey)
        xhr.send()
    }

    Timer {
        interval: 60000 // 1 minute
        running: true
        repeat: true
        onTriggered: updateStockPrice()
    }

    Component.onCompleted: updateStockPrice()
}