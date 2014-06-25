import QtQuick 2.0

import "elements"

Rectangle {
    id: game_level002
    width: 360
    height: 420

    property int m_margin: 65
    property int scorePoints: 0



    Phone {
        id: phoneAux
        visible: false
    }

    //signal buttonClick()
    MouseArea {
        id: mouseArea
        anchors.fill: phoneAux
        onClicked: {
            if (phoneAux.visible)
                if (phoneAux.isMeego)
                    scorePoints +=10
                else
                    scorePoints -=5
        }
    }

    ScoreBoard {
        id: scoreboard
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 10
        isVisible: true
        scoreText: scorePoints.toString()
    }

    Rectangle {
        id: r1
        width: 24
        height: 36
        border.color: "lightblue"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: m_margin

    }

    Phone {
        id: phone01
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone02
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone03
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone04
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone05
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone06
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone07
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone08
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    Phone {
        id: phone09
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: m_margin
        visible: false
        Component.onCompleted: setup()
    }

    property int timerIntervel: 1000
    property bool gameRunning: true
    property bool isVisible: false



    Timer {
        id: timerAnimation
        interval: timerIntervel
        running: gameRunning
        repeat: gameRunning



        onTriggered: {
            console.log(phoneAux.visible)

            phoneAux.visible = !phoneAux.visible

            var phone=Math.floor( Math.random() * 8 + 1)

            switch(phone) {
                case 1:
                    phoneAux.x = phone01.x; console.log("phone01")
                    phoneAux.y = phone01.y
                    break;
                case 2:
                    phoneAux.x = phone02.x; console.log("phone02")
                    phoneAux.y = phone02.y
                    break;
                case 3:
                    phoneAux.x = phone03.x; console.log("phone03")
                    phoneAux.y = phone03.y
                    break;
                case 4:
                    phoneAux.x = phone04.x; console.log("phone04")
                    phoneAux.y = phone04.y
                    break;
                case 5:
                    phoneAux.x = phone05.x; console.log("phone05")
                    phoneAux.y = phone05.y
                    break;
                case 6:
                    phoneAux.x = phone06.x; console.log("phone06")
                    phoneAux.y = phone06.y
                    break;
                case 7:
                    phoneAux.x = phone07.x; console.log("phone07")
                    phoneAux.y = phone07.y
                    break;
                case 8:
                    phoneAux.x = phone08.x; console.log("phone08")
                    phoneAux.y = phone08.y
                    break;
                case 9:
                    phoneAux: phone09; console.log("phone09")
                    break;
                default:
                    phoneAux: phone09; console.log("phone09")
            }
            phoneAux.setup()
            //phoneAux.visible = !phoneAux.visible

        }
    }


    Grid {
        id: m_grid
        columns: 3

        Phone {
            id:m_x
        }

    }

    MouseArea {
        id: mmm
        x: m_x.x
        y: m_x.y
        width: m_x.width
        height: m_x.height
        onClicked: console.log("mousingggg")
    }


    signal exit()
    Button01 {
        id: btn_exit
        width: 50
        height: 31
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10
        textBtn: "Exit"
        onButtonClick: exit()
    }

}
