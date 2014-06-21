import QtQuick 2.0

Rectangle {
    id: about
    width: 360
    height: 420

    Image {
        id: iconBoat
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.margins: 10
        source: "qrc:/images/images/jolla_boat.png"
    }

    Text {
        id: textGame
        anchors.left: iconBoat.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        font.family: "Comic Sans MS"
        font.pixelSize: 20
        text: qsTr("Konia Game")
    }

    Text {
        id: textAbout
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: iconBoat.bottom
        anchors.topMargin: 20
        font.family: "Comic Sans MS"
        font.pixelSize: 14
        color: "black"
        text: qsTr("Developer: João de Deus\nDesigner: Bruno Dores\n\nWeb: http://soft-ingenium.planetaclix.pt/\n\nEmail: joaodeusmorgado@yahoo.com\n\nVersion 1.0.0 (2013)")

    }


    signal aboutClicked()
  //  onAboutClicked: console.log("about")
    MouseArea {
        id: mouseArea
        anchors.fill: parent//btn_About
        onClicked: aboutClicked()
    }

}
