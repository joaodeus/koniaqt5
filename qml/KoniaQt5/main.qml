import QtQuick 2.0


Rectangle {
    id: root
    width: 360
    height: 420


    StatesManager {
        id: pagepanel
        state: "initialPage"
       // state: "level_001"
       // state: "about"
        width: parent.width
        height: parent.height
    }


    onWidthChanged: {
    //    console.log("Rectangle width: ", width)
       // boat.pos.x: 0
    }
    onHeightChanged: {
      //  console.log("Rectangle height: ", height)
      //  boat.pos.y: height
    }

}

