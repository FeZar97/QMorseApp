import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.5

ColumnLayout {

    Layout.fillWidth: true
    Layout.fillHeight: true

    property var plcText
    property var labelText
    property var onlyReadable: true
    property var taText: textArea.text

    signal textChangedTE(string text)

    function setText(decodedText) {
        textArea.text = decodedText
    }

    Connections {
        target: textArea
        function onTextChanged() {
            textChangedTE(textArea.text)
        }
    }

    Label {
        Layout.fillWidth: true
        text: labelText
        font.family: "Courier new"
        font.pointSize: 13
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        border.color: "black"
        border.width: 2

        TextArea {
            id: textArea

            width: parent.width
            height: parent.height

            selectByMouse: true
            readOnly: onlyReadable

            placeholderText: qsTr(plcText)
            wrapMode: Text.WordWrap
            font.family: "Courier new"
            font.pointSize: 13
        }
    }
}
