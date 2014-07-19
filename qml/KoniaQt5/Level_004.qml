import QtQuick 2.0

import QtQuick.Particles 2.0

Rectangle {
    id: game_level003
    width: 360
    height: 420


    ParticleSystem {
        id: particleSystem
    }


    Emitter {
        id: emitter
        anchors.centerIn: parent
        width: 40; height: 40
        system: particleSystem
        emitRate: 10
        lifeSpan: 1000
        lifeSpanVariation: 500
        size: 12
        endSize: 6

        velocity: AngleDirection {
                    angle: 90
                    angleVariation: 60
                    magnitude: 80
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


}
