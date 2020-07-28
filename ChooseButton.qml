import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Button {
    id: chooseButton
    text: buttonText

    signal getAction(string fileName)

    property var buttonText
    property var titleText




    onClicked: {
        fileDialog.open()
    }
}
