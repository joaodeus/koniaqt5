var component;
var boat;

function createBoat() {
    component = Qt.createComponent("Boat.qml")
    if (component.status == Component.Ready)
        finishCreation()
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status == Component.Ready) {
        boat = component.createObject(game_level003, {"x":10, "y": 10});
        if (boat == null) // Error handling
            console.log("Error creating boat")
    }
    else if (component.status == Component.Error) {
        //Error handling
        console.log("Error handling component:",component.errorString());
    }
}

function createBoatOnTheFly(m_parent, x, y) {
    component = Qt.createComponent("Boat.qml")
    boat = component.createObject(m_parent, {"x":x, "y":y});
}

/*
var component;
var sprite;

function createSpriteObjects() {
    component = Qt.createComponent("Sprite.qml");
    if (component.status == Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {
    if (component.status == Component.Ready) {
        sprite = component.createObject(appWindow, {"x": 100, "y": 100});
        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
}*/
