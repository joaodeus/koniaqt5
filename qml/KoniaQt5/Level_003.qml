import QtQuick 2.0
import "BoatLogic.js" as Logic

import DrawingBoard 1.0

Rectangle {
    id: game_level003
    width: 360
    height: 420

    BoardDrawing {
        id: m_drawingBoard
        width: parent.width
        height: parent.height

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        //hoverEnabled: true
        onMouseXChanged: m_drawingBoard.addPoint(mouseX,mouseY)
        onMouseYChanged: m_drawingBoard.addPoint(mouseX,mouseY)
        /*onClicked: {
            console.log("x,y:"+mouseX+","+mouseY)
            m_drawingBoard.addPoint(mouseX,mouseY)
       // onMouseXChanged: m_drawingBoard.addPoint(mouseX,mouseY)
       // onMouseYChanged: m_drawingBoard.addPoint(mouseX,mouseY)
        }*/
    }

    signal exit()
    Button01 {
        id: btn_exit
        width: 50
        height: 31
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 10
        textBtn: "Exit"
        onButtonClick: exit()
    }

    property int margin: 10
    MenuPaintButtons { // this is just a QML menu with QML buttons
        id: menu
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: margin
        newWidth: root.width //used for flickling the buttons
        onBtn_white: m_drawingBoard.setColor("white")
        onBtn_yellow: m_drawingBoard.setColor("yellow")
        onBtn_orange: m_drawingBoard.setColor("orange")
        onBtn_red: m_drawingBoard.setColor("red")
        onBtn_lightblue: m_drawingBoard.setColor("lightblue")
        onBtn_blue: m_drawingBoard.setColor("blue")
        onBtn_green: m_drawingBoard.setColor("green")


    }

    /*

    function loadBoat() {
        var component = Qt.createComponent("Boat.qml");
        if (component.status == Component.ready) {
            var boat = component.createObject(game_level003)
            console.log("compnent created")

        }
    }

    //Component.onCompleted: Logic.createBoat();
    Component.onCompleted: Logic.createBoatOnTheFly(game_level003, 50, 150);

    Component.objectName: "boaty"


    property string mousePosX
    property string mousePosY

    Text {
        id: m_text
        text: mousePosX + ":" + mousePosY
        anchors.bottom: parent.bottom
    }


    MouseArea {
        id: mouseArea
       // anchors.fill: parent

        anchors.top: btn_exit.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        hoverEnabled: true
        onMouseXChanged: mousePosX = mouseX.toString()
        onMouseYChanged: mousePosY = mouseY.toString()


        onClicked: {

            var str = 'import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20}';
            var str2 = 'import QtQuick 2.0; Rectangle {color: "red"; width: 20; height: 20; x:' + mouseX.toString() + '; y:'+ mouseY.toString() + '}';
            var newObject = Qt.createQmlObject(str2,
                game_level003, "dynamicSnippet1");
            console.log("new boat")

            Logic.createBoatOnTheFly(game_level003, mouseX, mouseY)
           // var component = Qt.createComponent("Boat.qml")
           // var boat = component.createObject(game_level003, {"x":Math.random()*game_level003.width , "y": Math.random()*game_level003.height});
        }
    }
*/
}
