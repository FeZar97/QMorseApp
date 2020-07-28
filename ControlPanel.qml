import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.1

RowLayout {

    id: rowLayout
    Layout.margins: 5
    spacing: 5

    signal saveText(string fileName)

    // open dialog
    FileDialog {
        id: fileOpenDialog
        title: qsTr("Open file")
        nameFilters: [ "TXT files (*.txt)"]
        fileMode: FileDialog.OpenFile
        onAccepted: converter.openFile(fileOpenDialog.file)
    }

    // save dialog
    FileDialog {
        id: fileSaveDialog
        title: "Save file"
        fileMode: FileDialog.SaveFile
        nameFilters: [ "TXT files (*.txt)"]
        onAccepted: saveText(fileSaveDialog.file)
    }

    // import button
    SimpleButton {
        id: importButton
        text: qsTr("Import")
        onClicked: fileOpenDialog.open()
    }

    // save button
    SimpleButton {
        id: saveButton
        text: qsTr("Save")
        onClicked: fileSaveDialog.open()
    }
}
