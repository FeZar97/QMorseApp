import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {
    Layout.margins: 5
    spacing: 5

    Layout.fillHeight: true

    // input text
    TextEditor {
        id: inputTextEdit
        plcText: qsTr("Text to translete")
        onlyReadable: false

        onTextChanged: converter.processText(text)
    }

    // switch button
    SwitchButton {
        id: switchButton
    }

    // output text
    TextEditor {
        id: outputTextEdit
        plcText: qsTr("Transleted text")
        onlyReadable: true
    }
}
