import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Layouts 1.10
import QtQuick.Controls 2.5

ColumnLayout {

    property var plcText
    property var onlyReadable: true

    signal textChanged(string text)

    Layout.fillWidth: true
    Layout.fillHeight: true

    Rectangle {
        Layout.fillWidth: true
        Layout.fillHeight: true
        border.color: "black"
        border.width: 2

        TextArea {
            id: inputText

            width: parent.width
            height: parent.height

            selectByMouse: true
            readOnly: onlyReadable

            placeholderText: qsTr(plcText)
            wrapMode: Text.WordWrap
            font.family: "Courier new"
            font.pointSize: 13

            onTextChanged: textChanged(text)
        }
    }
}
