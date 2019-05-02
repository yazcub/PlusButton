import QtQuick 2.11
import QtGraphicalEffects 1.0
import PlusButton 1.0

Item {
    id: circlebuttonroot
    width: Constants.buttonsizes_width
    height: Constants.buttonsizes_height

    property alias circlebuttonstate: circlebutton.state
    Rectangle {
        id: circlebutton
        color: "transparent"

        Image {
            id: button
            source: "images/button.png"
            sourceSize.width: Constants.buttonsizes_width
            sourceSize.height: Constants.buttonsizes_height
        }


        DropShadow {
            anchors.fill: button
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: button
        }
        Colorize {
            id: _colorizer
            anchors.fill: button
            source: button
            hue: 0.0
            saturation: 0
            lightness: 0.1
            opacity: 0
        }

        states: [
            State {
                name: "open"
                PropertyChanges {
                    target: circlebuttonroot
                    rotation: 45
                }
                PropertyChanges {
                    target: _colorizer
                    opacity: 1

                }
            },
            State {
                name: "close"
                PropertyChanges {
                    target: circlebuttonroot
                    rotation: 1
                }
                PropertyChanges {
                    target: _colorizer
                    opacity: 0

                }
            }
        ]

        transitions: [
            Transition {
                to: "open"
                RotationAnimation { duration: 300; direction: RotationAnimation.Clockwise; easing {type: Easing.OutBack; overshoot: 3}}
                OpacityAnimator { target: _colorizer; from: 0; to: 1; duration: 200}

            },
            Transition {
                to: "close"
                RotationAnimation { duration: 300; direction: RotationAnimation.Counterclockwise; easing {type: Easing.OutBack; overshoot: 3}}
                OpacityAnimator { target: _colorizer; from: 1; to: 0; duration: 300}
            }
        ]
    }
}
