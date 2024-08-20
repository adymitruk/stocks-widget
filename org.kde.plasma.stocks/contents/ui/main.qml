import QtQuick 2.0
import org.kde.plasma.components 2 as PlasmaComponents


PlasmaComponents.Label {
    text: if (plasmoid.configuration.exampleConfig) {
        "Hello, World! true"
    } else {
        "Hello, World! false"
    }
}