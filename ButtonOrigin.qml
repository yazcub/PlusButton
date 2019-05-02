import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import PlusButton 1.0

Item {
    id: _buttonoriginroot
    width: Constants.buttonsizes_width
    height: Constants.buttonsizes_height
    property string buttontext: "default\ntext"
    property string buttonicon: ""
    property string fonttyp: "" // brand, solid, regular

    Rectangle {
        id: circlebutton
        color: "transparent"

        Image {
            id: button
            source: "images/origin_button.png"
            sourceSize.width: Constants.buttonsizes_width
            sourceSize.height: Constants.buttonsizes_height
        }

        DropShadow {
            anchors.fill: button
            horizontalOffset: 1
            verticalOffset: 1
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: button
        }

        Colorize {
            id: _colorizer
            anchors.fill: button
            source: button
            hue: 0.1
            saturation: 0.8
            lightness: 0.3
            opacity: 0
        }

        states: [
            State {
                name: "hoverenter"
                PropertyChanges {
                    target: _colorizer
                    opacity: 1
                }
            },
            State {
                name: "hoveredexit"
                PropertyChanges {
                    target: _colorizer
                    opacity: 0
                }
            }
        ]

    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 0

        Text {
            id: _buttonicon
            font.family: fontselect()
            color: "#fff"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
            text: buttonicon
            font.pixelSize: 20
        }

        Text{
            id: _buttontext
            text: buttontext
            color: "#fff"
            font.capitalization: Font.AllUppercase
            font.family: Constants.fontTextFamily
            font.pixelSize: 10
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter

        }
    }


    function fontselect() {
        if (fonttyp === Constants.brand)
            return Constants.fontBrandFamily
        if (fonttyp === Constants.solid)
            return Constants.fontSolidFamily
        if (fonttyp === Constants.regular)
            return Constants.fontRegularFamily
    }

    MouseArea {
        id:_v
        anchors.fill: parent
        hoverEnabled: true
        onEntered: { circlebutton.state='hoverenter'}
        onExited: { circlebutton.state='hoveredexit'}

    }
}
