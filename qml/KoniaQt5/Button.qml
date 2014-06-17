import QtQuick 2.0

Rectangle {
    id: button
    width: 100
    height: 62
    border.color: "aqua"
    radius: 25

    property string textBtn: "Button"
    //property int show: 1

    Text {
        id: buttonLabel
        anchors.centerIn: button
        //color: activePalette.buttonText
        text: textBtn
    }

    signal buttonClick()
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClick()
    }
}
