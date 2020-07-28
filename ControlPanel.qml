import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {

    id: rowLayout
    Layout.margins: 5
    spacing: 5

    signal openFile(string fileName)
    signal saveFile(string fileName)

    // file import
    ChooseButton {
        id: importButton
        buttonText: qsTr("Import")
        titleText: qsTr("Import text from file")
        onGetAction: openFile(fileName)
    }

    // save file
    ChooseButton {
        id: saveButton
        buttonText: qsTr("Save")
        titleText: qsTr("Import transleted text to file")
        onGetAction: saveFile(fileName)
    }
}
