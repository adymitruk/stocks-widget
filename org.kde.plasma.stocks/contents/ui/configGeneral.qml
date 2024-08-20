import QtQuick 2.0
import QtQuick.Controls 2.5 as QQC2
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
    property alias cfg_exampleConfig: exampleCheckBox.checked

    QQC2.CheckBox {
        id: exampleCheckBox
        text: i18n("Example configuration option")
    }
}