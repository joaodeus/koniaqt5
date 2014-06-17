import QtQuick 2.0

import "elements"

Rectangle {
    id: root
    width: 360
    height: 420

    //signals
    signal stop()


    Sun {
        id: sun
        anchors.top: parent.top
        anchors.right: parent.right
        onSunClick: stop()
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
     Image {
         id: plataform
         anchors.bottom: sea.top
         anchors.horizontalCenter: parent.horizontalCenter
         source: "qrc:/images/images/plataform.png"
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

}
