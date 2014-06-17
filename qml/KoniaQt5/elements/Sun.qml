import QtQuick 2.0

// Sun
Image {
    id: sun
    x: 0
    y: 0
    width: 80
    height: 80
    source: "qrc:/images/images/sun.png"

    signal sunClick()
    MouseArea {
        id: mousearea
        anchors.fill: parent
        onClicked: sunClick()
    }
}
