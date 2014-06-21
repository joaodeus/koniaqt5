import QtQuick 2.0

Rectangle {
    id: root
    width: 360
    height: 420

    // signals
    signal gameclick()
    signal about()

    //Sky
    Rectangle {
        id: sky
        width: parent.width
        height: parent.height / 2
        anchors.top: parent.top
        color: "aliceblue"
    }

    //ocean
    Rectangle {
        id: ocean
        width: parent.width
        height: parent.height / 2
        anchors.bottom: parent.bottom
        color: "lightblue"
    }

    //Sun
    Image {
        id: sun
        width: 80
        height: 80
        source: "qrc:/images/images/sun.png"
        anchors.top: parent.top
        anchors.right: parent.right
    }

    //Boat
    Boat {
        id: boat
        property real t;
        x: parent.width / 2 + parent.width / 3 * Math.sin(t * Math.PI * 2) - width / 2;
        y: parent.height / 2 + parent.height / 20 * Math.cos(t * Math.PI * 12) /*-height*/;
        NumberAnimation on t { from: 0; to: 1; duration: 10000; loops: Animation.Infinite }
    }




    Row {
        id: columnbuttons
        spacing: 15
        height: parent.height / 2
      //  width: parent.width
        anchors.bottom: parent.bottom
        //anchors.left: parent.left
        //anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: columnbuttons.spacing
        anchors.bottomMargin: columnbuttons.spacing

        Button01 {
            id:aboutBtn
            textBtn: "About"
           // anchors.leftMargin: 12
            anchors.bottom: parent.bottom
            onButtonClick: about()
        }

        Button01 {
            id:startGameBtn
            textBtn: "Start Game"
           // anchors.leftMargin: 12
            anchors.bottom: parent.bottom
            onButtonClick: gameclick()
        }

        Button01 {
            id: gameExit
            textBtn: "Exit"
            anchors.bottom: parent.bottom
            onButtonClick: Qt.quit()

        }
    }



}
