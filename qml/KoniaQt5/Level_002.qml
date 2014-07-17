import QtQuick 2.0

import "elements"

Rectangle {
    id: game_level002
    width: 360
    height: 420

    color: "HoneyDew"

    property int scorePoints: 0
    property string borderColor: "red"
    property int borderWidth: 1
    property int m_margin: width / 5
    property int rWith: m_phone.width * 2
    property int rHeight: m_phone.height * 2


    Phone {
        id: m_phone
        x: r1.x
        y: r1.y
        z:1
        visible: false
        Component.onCompleted: setup()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: m_phone
        onClicked: {
            if (m_phone.visible) {
                if (m_phone.isMeego)
                    scorePoints -= 5
                else
                    scorePoints += 10
            }

                m_borderHammerDown.x = m_phone.x
                m_borderHammerDown.y = m_phone.y

                m_borderHammerDown.visible = true
                m_borderHammerUp.visible = false
                m_phone.visible = false

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

    //Time left score board
    ScoreBoard {
        id: timeleft
        width: 90
        anchors.top: parent.top
        anchors.left: scoreboard.right
        anchors.margins: 10
        isVisible: true
        scoreText: "time left: " + (x_time/1000).toString() + "s"
    }




    FramePhone {
        id: r1
        width: rWith
        height: rHeight

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: m_margin
    }

    FramePhone {
        id: r2
        width: rWith
        height: rHeight

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: m_margin
    }

    FramePhone {
        id: r3
        width: rWith
        height: rHeight

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: m_margin
    }

    FramePhone {
        id: r4
        width: rWith
        height: rHeight

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.margins: m_margin
    }

    FramePhone {
        id: r5
        width: rWith
        height: rHeight

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: m_margin
    }

    FramePhone {
        id: r6
        width: rWith
        height: rHeight

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.margins: m_margin
    }

    FramePhone {
        id: r7
        width: rWith
        height: rHeight

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: m_margin
    }

    FramePhone {
        id: r8
        width: rWith
        height: rHeight

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: m_margin
    }

    FramePhone {
        id: r9
        width: rWith
        height: rHeight

        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: m_margin
    }


    //hammer
    Item {
        id: m_borderHammerDown
        width: 56
        height: 58
        x: 50
        y: 100

        visible: false

        Image {
            id: hammer2
            anchors.fill: parent
            source: "qrc:/images/images/hammerDown.png"
        }
    }

    //hammer
    Rectangle {
        id: m_borderHammerUp
        width: 56
        height: 58
        anchors.left: parent.left
        anchors.bottom: parent.bottom

        Image {
            id: hammer1
            anchors.fill: parent
            source: "qrc:/images/images/hammerUp.png"
        }
    }



    property int timerInterval: 1000
    property bool gameRunning: true
    property bool isVisible: false
    property int duration: 60000 // 1 minute
    property int x_time: duration

    function resetLevel() {
        x_time = duration
    }

    Timer {
        id: timerAnimation
        interval: timerInterval
        running: gameRunning
        repeat: gameRunning



        onTriggered: {



            console.log(m_phone.visible)

            m_borderHammerUp.visible = true
            m_borderHammerDown.visible = false
            m_phone.visible = true
            m_phone.setup2(0.3)


            x_time -= timerInterval
            console.log("x_time: "+x_time)
            if (x_time <= 0) {
                gameRunning = false
                m_phone.visible = false
            }


            var phonePosition=Math.floor( Math.random() * 8 + 1)

            switch(phonePosition) {
                case 1:
                    m_phone.x = r1.x+r1.width/2-m_phone.width/2
                    m_phone.y = r1.y+r1.height/2-m_phone.height/2
                    break;
                case 2:
                    m_phone.x = r2.x+r2.width/2-m_phone.width/2
                    m_phone.y = r2.y+r2.height/2-m_phone.height/2
                    break;
                case 3:
                    m_phone.x = r3.x+r3.width/2-m_phone.width/2
                    m_phone.y = r3.y+r3.height/2-m_phone.height/2
                    break;
                case 4:
                    m_phone.x = r4.x+r4.width/2-m_phone.width/2
                    m_phone.y = r4.y+r4.height/2-m_phone.height/2
                    break;
                case 5:
                    m_phone.x = r5.x+r5.width/2-m_phone.width/2
                    m_phone.y = r5.y+r5.height/2-m_phone.height/2
                    break;
                case 6:
                    m_phone.x = r6.x+r6.width/2-m_phone.width/2
                    m_phone.y = r6.y+r6.height/2-m_phone.height/2
                    break;
                case 7:
                    m_phone.x = r7.x+r7.width/2-m_phone.width/2
                    m_phone.y = r7.y+r7.height/2-m_phone.height/2
                    break;
                case 8:
                    m_phone.x = r8.x+r8.width/2-m_phone.width/2
                    m_phone.y = r8.y+r8.height/2-m_phone.height/2
                    break;
                case 9:
                    m_phone.x = r9.x+r9.width/2-m_phone.width/2
                    m_phone.y = r9.y+r9.height/2-m_phone.height/2
                    break;
                default:
                    m_phone.x = r9.x+r9.width/2-m_phone.width/2
                    m_phone.y = r9.y+r9.height/2-m_phone.height/2
            }



            //phoneAux.visible = !phoneAux.visible

        }
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
