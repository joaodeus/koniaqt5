import QtQuick 2.0

Rectangle {    
    id: level
    border.color: "red"
    border.width: 2
  //  opacity: 1
    radius: 25
    width: 80
    height: 80

    property string textBtn: "Button"
    Text {
        id: text_level
        anchors.centerIn: level
        //color: activePalette.buttonText
        text: textBtn
    }

    signal buttonClick()
    MouseArea {
        anchors.fill: level
        onClicked: buttonClick()
    }
}
