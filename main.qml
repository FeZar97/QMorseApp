import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.5

Window {
    id: mainWindow
    visible: true
    width: Screen.width / 1.8
    height: Screen.height / 1.8
    title: qsTr("MorseApp")

    Connections {
        target: converter
        onEncodedTextReady: textPanel.setEncodedText(encodedText)
        onDecodedTextReady: textPanel.setDecodedText(decodedText)
    }

    ColumnLayout {
        id: mainLayout
        anchors.fill: parent

        ControlPanel {
            id: controlPanel
            onSaveText: converter.saveText(fileName, textPanel.outputText)
        }

        TextPanel {
            id: textPanel
        }
    }
}
