import QtQuick 2.0
import QtQuick.Particles 2.0

import "elements"
import "Logic.js" as Logic

Rectangle {
    id: game_level001
    width: 360
    height: 420


    //signals
    signal stop() // triggered when the sun is clicked
    onStop: {
        m_phone.x = Logic.PhoneInitialPositionX(parent.width, m_phone.width)
        m_phone.y = Logic.PhoneInitialPositionY(parent.height, sea.height, plataform.height, m_phone.height)
        m_phone.finalPosition_x = Logic.PhoneFinalPositionX(parent.width)
        m_phone.finalPosition_y = Logic.PhoneFinalPositionY(parent.height, sea.height)
        //animation: false
      //  gameDurationCount: gameDuration
    }

    signal pause()
    onPause: {
        animation: false
    }

    ScoreBoard {
        id: scoreboard
        anchors.top: parent.top
        anchors.left: parent.left
        isVisible: true
        scoreText: scorePoints.toString()
    }

    //time left board
    ScoreBoard {
        id: time_left
        width: 90
        anchors.top: parent.top
        anchors.left: scoreboard.right
        isVisible: true
        scoreText: "time left: " + (gameDurationCount/1000).toString() + "s"
    }


    Sun {
        id: sun
        anchors.top: parent.top
        anchors.right: parent.right
        onSunClick: {
            stop()
            console.log("level 1 - sun clicked")

        }
        //onSunClick: pause()
    }

    //Sea
     Rectangle {
         id: sea
         anchors.bottom: parent.bottom
         width: parent.width
         height: parent.height * 0.35
         color: "#B9EEFA"
     }

     // beach image
     Image {
         id: beach
         width: 188/2
         height: 256/2
         anchors.left: parent.left
         anchors.bottom: sea.top
         source: "qrc:/images/images/beach_palmtree.png"
     }

     //another beach image
     Image {
         id: beach2
         width: 128
         height: 128
         anchors.right: parent.right
         anchors.bottom: sea.top
         source: "qrc:/images/images/beach_sand.png"
     }



     //Plataform
     Plataform {
         id: plataform
         anchors.bottom: sea.top
         anchors.horizontalCenter: parent.horizontalCenter
     }


     ParticleSystem {
         id: particleSystem
     }


     Emitter {
         id: emitter
         anchors.top: plataform.top
         anchors.horizontalCenter: plataform.horizontalCenter
         anchors.margins: 60
         width: 20; height: 20
         system: particleSystem
         emitRate: 20
         lifeSpan: 1000
         lifeSpanVariation: 500
         size: 12
         endSize: 6

         velocity: AngleDirection {
                     angle: 90
                     angleVariation: 60
                     magnitude: 120
                     magnitudeVariation: 30
                 }
     }

     ImageParticle {
         source: "qrc:/images/images/fireParticle1.png"
         system: particleSystem
         color: '#FFD700'
         colorVariation: 0.2
        // entryEffect: ImageParticle.Scale
     }





     //Waves above the sea
     Image {
         id: waves
         width: parent.width
         anchors.bottom: sea.top
         source: "qrc:/images/images/waves.png"
     }


     //boat
     Boat {
         id:boat
         width: 88
         height: 96
         x: 0
         y: parent.height-boat.height

         drag.minimumY: parent.height - boat.height - sea.height
         drag.maximumY: parent.height - boat.height
         drag.minimumX: 0
         drag.maximumX: parent.width - boat.width
         drag.target: boat
     }


     Phone {
         id: m_phone
         x: Logic.PhoneInitialPositionX(parent.width, m_phone.width)
         y: Logic.PhoneInitialPositionY(parent.height, sea.height, plataform.height, m_phone.height)
         finalPosition_x: Logic.PhoneFinalPositionX(parent.width)
         finalPosition_y: Logic.PhoneFinalPositionY(parent.height, sea.height)
         isFalling: animation
     }

     //properties
     property bool animation: true
     property int scorePoints: 0

     property int gameDuration: 60000 //miliseconds
     property int gameDurationCount: gameDuration

     function resetLevel() {
         gameDurationCount = gameDuration
         //animation = true
     }

     Timer {
         id: timerAnimation
         interval: m_phone.animationDuration
         running: animation
         repeat: animation

         onTriggered: {
             gameDurationCount -= m_phone.animationDuration
             if (gameDurationCount <= 0)
             {
                 console.log("end game")
                 stop()
             }


             if (Logic.checkColision(m_phone.finalPosition_x+m_phone.width/2, m_phone.finalPosition_y+m_phone.height/2,
                               boat.x+boat.width/2,boat.y+boat.height/2))
             {
                 if (m_phone.isMeego)
                     scorePoints += 10
                 else
                     scorePoints -= 5
             }

             m_phone.setup(m_phone.isMeego) //sets if its a Meego or a W.. phone
             m_phone.x = Logic.PhoneInitialPositionX(game_level001.width, m_phone.width)//game.width / 2
             m_phone.y = Logic.PhoneInitialPositionY(game_level001.height, sea.height, plataform.height, m_phone.height)
             m_phone.finalPosition_x = Logic.PhoneFinalPositionX(parent.width)
             m_phone.finalPosition_y = Logic.PhoneFinalPositionY(parent.height, sea.height)

             console.log(m_phone.x)
             console.log(m_phone.y)
             console.log(m_phone.finalPosition_x)
             console.log(m_phone.finalPosition_y)

             m_phone.isFalling = false
             m_phone.isFalling = true
         }
     }

}
