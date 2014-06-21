import QtQuick 2.0

import "elements"

Rectangle {
    id: game_level002
    width: 360
    height: 420

    Grid {
        columns: 3
        spacing: 2

        Phone {
            id: phone00
        }

        Phone {
            id: phone01
        }

        Phone {
            id: phone02
        }
        Phone {
            id: phone10
        }

    }
}
