import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
//import QtQuick.Controls 1.2

import "elements"

Rectangle {
    id: root
    width: 360
    height: 420

    property int fontsize: 10
    property int margins: 10
    property string fontfamily: "sans"

    Flickable {
        id: flickable_text
        anchors.top: m_rectangle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
       // anchors.margins: 10

        width: parent.width
        height: parent.height - btn_skip.height
        contentWidth: parent.width
        contentHeight: text_rectangle.height + margins*2

        Rectangle {
            id: text_rectangle
          //  width: parent.width
            height: m_text1.height + m_text2.height + m_text3.height + m_text4.height + m_text5.height
                    + m_text6.height + m_plataform.height + m_jolla.height
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 10

            Text {
                id: m_text1
                width: parent.width
                anchors.top: text_rectangle.top
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                text: "Somewhere in the middle of the ocean lays a mobile factory."
            }

            Plataform {
                id: m_plataform

                width: 153/2
                height: 223/2

                anchors.top: m_text1.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
            }


            Text {
                id: m_text2
                width: parent.width
                anchors.top: m_plataform.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                text: "One day, a fire starts, and like a burning plataform, havoc and kaos take place.\n\n"+
                      "Fire and explosions, phones flying into the ocean...\n\n" +
                      "Luckly, a small boat, a jolla, passes by and starts saving the day."
            }


            Boat {
                id: m_jolla

                width: 44+22
                height: 48+24

                anchors.top: m_text2.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
            }

            Text {
                id: m_text3
                width: parent.width
                anchors.top: m_jolla.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                text: "You are Jolla."
            }

            Text {
                id: m_text4
                width: parent.width
                anchors.top: m_text3.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                color: "green"
                text: "\nStart catchin the falling phones, the good ones marked with a M, and you will score points."
            }

            Text {
                id: m_text5
                width: parent.width
                anchors.top: m_text4.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                color: "orange"
                text: "\nDon't catch the ones marked with a W, they are evil and will destroy your boat, ..." +
                      " aham make you lose point."
            }

            Text {
                id: m_text6
                width: parent.width
                anchors.top: m_text5.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                text: "\nAnd so the quest begins..."
            }
        }

    }

    signal btnSkip()

    Rectangle {
        id: m_rectangle
        width: parent.width
        height: 60
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Button01 {
            id: btn_skip
            height: 40
            anchors.fill: parent
            anchors.margins: 10
            family: fontfamily
            pointSize: fontsize
            textBtn: "Next"
            onButtonClick: btnSkip()
        }

    }

}
