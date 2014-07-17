import QtQuick 2.0

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
            height: m_text1.height + m_text2.height +//+ m_text3.height + m_text4.height + m_text5.height
                   m_plataform.height
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
                text: "Back in the factory, before the fire:"
            }

            //hammer
            Rectangle {
                id: m_borderHammerUp
                width: 50
                height: 50

                anchors.top: m_text1.bottom
                anchors.right: m_plataform.left

                Image {
                    id: hammer1
                    anchors.fill: parent
                    source: "qrc:/images/images/hammerUp.png"
                }
            }

            Phone {
                id: m_plataform
               // width: 153/2
               // height: 223/2
                anchors.top: m_text1.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
            }

            Component.onCompleted: {
                m_plataform.setup2(1)
                m_phoneW.setup2(0)
            }


            Phone {
                id: m_phoneW
                onSetupW: ;
               // width: 153/2
               // height: 223/2
                anchors.top: m_text1.bottom
                anchors.left: m_plataform.right
                anchors.margins: 10
            }


            Text {
                id: m_text2
                width: parent.width
                anchors.top: m_plataform.bottom
                font.family: fontfamily
                font.pointSize: fontsize
                wrapMode: Text.WordWrap
                text: "There is a assembly line, where good and defective phones are selected.\n\n"+
                      "Use the hammer to destroy the defective W phones and you will win points.\n\n" +
                      "Be carefull not to smash the good M phones, else you will lose points."
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
