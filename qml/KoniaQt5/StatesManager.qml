import QtQuick 2.0

//use this component to create different states and pages
// and associate each atate to each page

Item {
    id: root
    width: 360
    height: 420

    // States ----------------------------------------------------
    states: [
        State {
            name: "initialPage"
            PropertyChanges {
                target: initialPageID
                z: 1
                restoreEntryValues: true
            }
        },

        State {
            name: "menuLevels"
            PropertyChanges {
                target: menuLevelsID
                z: 1
                restoreEntryValues: true
            }
        },

        State {
            name: "about"
            PropertyChanges {
                target: aboutID
                z: 1
                restoreEntryValues: true
            }
        },

        State {
            name: "level_001"
            PropertyChanges {
                target: level_001ID
                z: 1
                restoreEntryValues: true
            }
        }

    ]



    // Pages ----------------------------------------------------

    About {
        id: aboutID
        z: 0
        onAboutClicked: root.state = "initialPage"

    }

    InitialPage {
        id: initialPageID
        anchors.fill: parent
        z: 0
        onGameclick: root.state = "menuLevels"
        onAbout: root.state = "about"
    }


    MenuLevels {
        id: menuLevelsID
        anchors.fill: parent
        z: 0
        onMenuLevel_back: root.state = "initialPage"
        onLevel_01: root.state = "level_001"
    }

    // Levels
    Level_001 {
        id: level_001ID
        anchors.fill: parent
        z:0
        onStop: root.state = "menuLevels"
    }

}
