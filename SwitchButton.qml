import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

ColumnLayout {
    Button {
        id: switchButton
        text: "<->"
        onClicked: {
            console.log("switch text")
        }
    }
}
