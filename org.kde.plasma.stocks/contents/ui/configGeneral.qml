import QtQuick 2.0
import QtQuick.Controls 2.0 
import org.kde.kirigami 2.5 as Kirigami

Kirigami.FormLayout {
    property alias cfg_symbol: symbolTextField.text
    property alias cfg_apiKey: apiKeyTextField.text

    TextField {
        id: symbolTextField
        Kirigami.FormData.label: i18n("Stock Symbol:")
    }

    TextField {
        id: apiKeyTextField
        Kirigami.FormData.label: i18n("API Key:")
    }
}