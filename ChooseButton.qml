import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

Button {
    id: chooseButton
    text: buttonText

    signal getAction(string fileName)

    property var buttonText
    property var titleText

    FileDialog {
        id: fileDialog
        title: titleText
        folder: "file:///C:"
        nameFilters: [ "TXT files (*.txt)"]
        onAccepted: {
            getAction(fileDialog.fileUrl)
        }
    }

    onClicked: {
        fileDialog.open()
    }
}
