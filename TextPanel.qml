import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {
    Layout.margins: 5
    spacing: 5

    Layout.fillHeight: true

    property var inputText: inputTextEdit.taText
    property var outputText: outputTextEdit.taText

    // set encoded text
    function setEncodedText(encodedText) {
        inputTextEdit.setText(encodedText)
    }

    // set decoded text
    function setDecodedText(decodedText) {
        outputTextEdit.setText(decodedText)
    }

    // input text
    TextEditor {
        id: inputTextEdit
        plcText: qsTr("Text to translete")
        labelText: qsTr("Input text")
        onlyReadable: false

        onTextChangedTE: {
            converter.processText(text)
        }
    }

    // switch button
    SwitchButton {
        id: switchButton
        onClick: {
            inputTextEdit.setText(outputTextEdit.taText)
        }
    }

    // output text
    TextEditor {
        id: outputTextEdit
        plcText: qsTr("Transleted text")
        labelText: qsTr("Result text")
        onlyReadable: true
    }
}
