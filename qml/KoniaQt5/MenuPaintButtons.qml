import QtQuick 2.0

Rectangle {
    id: menuHybrid
    property int m_spacing: 5

    height: m_white.height
    color: "#fff396"


    signal btn_white();
    signal btn_yellow();
    signal btn_orange();
    signal btn_red();
    signal btn_lightblue();
    signal btn_blue();
    signal btn_green();




    property real newWidth : m_white.width * 5
    Flickable {
        id: flick
        width: newWidth
        //width: m_circle.width * 2
        height: m_white.height
        //contentWidth: 7 * (m_line.width + m_spacing) + m_spacing
        contentWidth: m_row.width + m_spacing*4
        contentHeight: height

        rebound: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }


        Row {
            id: m_row
            spacing: m_spacing

            ButtonPaint {
                id: m_white
                backgroundColor: "white"
                onButtonClick: btn_white()
            }

            ButtonPaint {
                id: m_yellow
                backgroundColor: "yellow"
                onButtonClick: btn_yellow()
            }

            ButtonPaint {
                id: m_orange
                backgroundColor: "orange"
                onButtonClick: btn_orange()
            }

            ButtonPaint {
                id: m_red
                backgroundColor: "red"
                onButtonClick: btn_red()
            }

            ButtonPaint {
                id: m_lightblue
                backgroundColor: "lightblue"
                onButtonClick: btn_lightblue()
            }

            ButtonPaint {
                id: m_blue
                backgroundColor: "blue"
                onButtonClick: btn_blue()
            }

            ButtonPaint {
                id: m_green
                backgroundColor: "green"
                onButtonClick: btn_green()
            }

        }
    }
}
