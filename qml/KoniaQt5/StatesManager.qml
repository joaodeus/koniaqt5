import QtQuick 2.0

//use this component to create different states and pages
// and associate each atate to each page

Item {
    id: root
    width: 360
    height: 420

    property int m_with: 360
    property int m_height: 420

    // States ----------------------------------------------------
    states: [
        State {
            name: "initialPage"
            PropertyChanges {
                target: initialPageID
                width: m_with
                height: m_height
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
                animation: true
                scorePoints: 0
                restoreEntryValues: true
            }
        },

        State {
            name: "level_001_introduction"
            PropertyChanges {
                target: level_001_introductionID
                z: 1
                restoreEntryValues: true
            }
        },

        State {
            name: "level_002"
            PropertyChanges {
                target: level_002ID
                z: 1
                restoreEntryValues: true
            }
        }

    ]



    // Pages ----------------------------------------------------

    About {
        id: aboutID
        z: 0
        onAboutClicked: {
            if (z == 0)
                return
            root.state = "initialPage"
        }

    }

    InitialPage {
        id: initialPageID
        //anchors.fill: parent
        width: 0
        height: 0
        z: 0
        onGameclick: root.state = "menuLevels"
        onAbout: root.state = "about"
    }


    MenuLevels {
        id: menuLevelsID
        anchors.fill: parent
        z: 0
        onMenuLevel_back: root.state = "initialPage"
        onLevel_01: root.state = "level_001_introduction"
        onLevel_02: root.state = "level_002"
    }

    // Levels
    Level_001 {
        id: level_001ID
        anchors.fill: parent
        z:0
        animation: false
        scorePoints: 0
        //onStop: root.state = "menuLevels"
        onStop: root.state = "initialPage"
        //onPause: root.state = "initialPage"
    }

    Level_001_introduction {
        id: level_001_introductionID
        anchors.fill: parent
        z:0
        onBtnSkip: root.state = "level_001"
    }

    Level_002 {
        id: level_002ID
        anchors.fill: parent
        z: 0
    }
}
