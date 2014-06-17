import QtQuick 2.0

Rectangle {
    id: root
    width: 360
    height: 420

  //  color: "darkblue"


    signal level_01()
    signal level_02()
    signal level_03()
    signal menuLevel_back()

    Grid {
        id: grid
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: 20
        anchors.leftMargin: 20
        columns: 3
        spacing: 20


       ButtonLevel {
           id: level01
           textBtn: "Level 1"
           onButtonClick: level_01()
       }

       ButtonLevel {
            id: level2
            textBtn: "Level 2"
            onButtonClick: level_02()
       }


       ButtonLevel {
            id: level3
            textBtn: "Level 3"
            onButtonClick: level_03()
       }


       ButtonLevel {
            id: level4
            textBtn: "Back"
            onButtonClick: menuLevel_back()
       }


    }



}
