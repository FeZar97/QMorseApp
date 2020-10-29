import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {
    Layout.fillHeight: true
    Layout.margins: 5
    spacing: 5

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
    SimpleButton {
        id: switchButton
        text: "<-"
        onClicked: inputTextEdit.setText(outputTextEdit.taText)
        // anchors.verticalCenter: parent.verticalCenter
    }

    // output text
    TextEditor {
        id: outputTextEdit
        plcText: qsTr("Transleted text")
        labelText: qsTr("Result text")
        onlyReadable: true
    }
}
