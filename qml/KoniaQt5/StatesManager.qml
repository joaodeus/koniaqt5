import QtQuick 2.0

//use this component to create different states and pages
// and associate each atate to each page

Item {
    id: root
    width: 360
    height: 420

    property int m_with: width
    property int m_height: height

    // States ----------------------------------------------------
    states: [
        State {
            name: "initialPage"
            PropertyChanges {
                target: initialPageID
                x: 0
                anchors.fill: parent
                restoreEntryValues: true
            }
        },

        State {
            name: "menuLevels"
            PropertyChanges {
                target: menuLevelsID
                x: 0
                anchors.fill: parent
                restoreEntryValues: true
            }
        },

        State {
            name: "about"
            PropertyChanges {
                target: aboutID
                x: 0
                anchors.fill: parent
                restoreEntryValues: true
            }
        },

        State {
            name: "level_001"
            PropertyChanges {
                target: level_001ID
                x: 0
                anchors.fill: parent
                animation: true
                scorePoints: 0
                gameDurationCount: 0
                restoreEntryValues: true
            }
        },

        State {
            name: "level_001_introduction"
            PropertyChanges {
                target: level_001_introductionID
                x: 0
                anchors.fill: parent
                restoreEntryValues: true
            }
        },

        State {
            name: "level_002"
            PropertyChanges {
                target: level_002ID
                x: 0
                anchors.fill: parent
                gameRunning: true
                scorePoints: 0
                restoreEntryValues: true
            }
        }

    ]



    // Pages ----------------------------------------------------

    About {
        id: aboutID
        x: m_with
        anchors.fill: parent
        onAboutClicked: {
            if (z == 0)
                return
            root.state = "initialPage"
        }

    }

    InitialPage {
        id: initialPageID        
        x: m_with
        onGameclick: root.state = "menuLevels"
        onAbout: root.state = "about"
    }


    MenuLevels {
        id: menuLevelsID
        x: m_with
        onMenuLevel_back: root.state = "initialPage"
        onLevel_01: root.state = "level_001_introduction"
        onLevel_02: root.state = "level_002"
    }

    // Levels
    Level_001 {
        id: level_001ID
        x: m_with
        animation: false
        scorePoints: 0
        gameDurationCount: 0
        //onStop: root.state = "menuLevels"
        onStop: root.state = "initialPage"
        //onPause: root.state = "initialPage"
    }

    Level_001_introduction {
        id: level_001_introductionID
        x: m_with
        onBtnSkip: root.state = "level_001"
    }

    Level_002 {
        id: level_002ID
        x: m_with

        gameRunning: false
        scorePoints: 0
        onExit: root.state = "initialPage"
    }


}
