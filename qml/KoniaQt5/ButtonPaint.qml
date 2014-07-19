import QtQuick 2.0

Rectangle {
    id:buttonHybrid
    width: 60
    height: width
    color: backgroundColor
    border.color: "black"
    //radius: width * 0.4
    radius: 24

    property string backgroundColor: "#F5B800"

    signal buttonClick()
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: buttonClick()
    }

}
