import QtQuick 2.0

Rectangle {
    id: score
    width: 45
    height: 25

    property bool isVisible: false
    property string scoreText: "000"

    Text {
        id: text1
        anchors.centerIn: parent
        text: scoreText
        font.family: "Arial"
        font.bold: true
        color: "peru"
        visible: isVisible
    }

    radius: 10
    border.width: 2
    border.color: "brown"
}
