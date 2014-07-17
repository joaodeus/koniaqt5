import QtQuick 2.0

import "../Logic.js" as Logic

//Phone
Item {
    id: phone
    width: 24
    height: 36

    property int finalPosition_x
    property int finalPosition_y
    property bool isMeego: true
    property string imageBackground: "qrc:/images/images/MPhone_white.png"

    property int animationDuration: 1000 //one second
    property bool isFalling: false

    signal setupM
    onSetupM: {
        isMeego = Logic.setPhoneRandomModel2(1)
        imageBackground = Logic.setPhoneColor(isMeego)
    }

    signal setupW
    onSetupW: {
        isMeego = Logic.setPhoneRandomModel2(0)
        imageBackground = Logic.setPhoneColor(isMeego)
    }



    function setup2(percentageOfBeingMeego) {
        isMeego = Logic.setPhoneRandomModel2(percentageOfBeingMeego)
        imageBackground = Logic.setPhoneColor(isMeego)
    }

    function setup() {
        isMeego = Logic.setPhoneRandomModel()
        imageBackground = Logic.setPhoneColor(isMeego)
    }

    /*signal setup
    onSetup: {
        isMeego = Logic.setPhoneRandomModel()
        imageBackground = Logic.setPhoneColor(isMeego)
    }*/

    Image {
        id: phoneImage
        anchors.fill: parent

        source: imageBackground
    }


    ParallelAnimation {
        id: phonefalling
        running: isFalling

        NumberAnimation {
            target: phone; property: "x";
            from: x;  to: finalPosition_x ;
            duration: animationDuration
        }

        NumberAnimation {
            target: phone; property: "y";
            from: y; to: finalPosition_y;
            duration: animationDuration
            easing {
                type: Easing.InCubic
            }
        }
    }

}
