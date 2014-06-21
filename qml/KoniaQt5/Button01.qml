import QtQuick 2.0

Rectangle {
    id: button
    width: 100
    height: 62
    border.color: "aqua"
    radius: 25

    property string textBtn: "Button"
    property string family: "sans"
    property int pointSize: 9

    Text {
        id: buttonLabel
        anchors.centerIn: button
        font.family: family
        font.pointSize: pointSize
        text: textBtn
    }

    signal buttonClick()
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClick()
    }
}
