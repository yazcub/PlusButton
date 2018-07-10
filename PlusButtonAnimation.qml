import QtQuick 2.11
import QtQuick.Window 2.11
import PlusButton 1.0
import QtGraphicalEffects 1.0

Window {
    id:root
    visible: true
    width: 480
    height: 600
//    width: 340
//    height: 640
    title: qsTr("Hello World")

    MenuButton{
        id: _menubutton
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Constants.bottomMargin

        z: 99
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if ( _menubutton.circlebuttonstate != "open") {
                    _menubutton.circlebuttonstate = "open"
                    _btorigin1.state="openmenu"
                    _btorigin2.state="openmenu"
                    _btorigin3.state="openmenu"
                    _btorigin4.state="openmenu"
                    _fastblurbackground.state="openmenu"

                }
                else {
                    _menubutton.circlebuttonstate = "close"
                    _btorigin1.state="closemenu"
                    _btorigin2.state="closemenu"
                    _btorigin3.state="closemenu"
                    _btorigin4.state="closemenu"
                    _fastblurbackground.state="closemenu"
                }
            }
        }
    }

    ButtonOrigin {
        id: _btorigin1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Constants.bottomMargin //150
        fonttyp: Constants.regular
        buttontext: "create\nfolder"
        buttonicon: "\uf07b"
        opacity: 0
        z:10

        states: [
            State {
                name: "openmenu"
                PropertyChanges {
                    target: _btorigin1
                    anchors.bottomMargin: 150
                    opacity: 1
                }
            },
            State {
                name: "closemenu"
                PropertyChanges {
                    target: _btorigin1
                    anchors.bottomMargin: Constants.bottomMargin
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "openmenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.OutBack;duration: 300 }
                OpacityAnimator {  from: 0; to: 1; duration: 200}
            },
            Transition {
                to: "closemenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.InBack;duration: 300 }
                OpacityAnimator { from: 1; to: 0; duration: 400}
            }
        ]
    }

    ButtonOrigin {
        id: _btorigin2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Constants.bottomMargin //250
        fonttyp: Constants.brand
        buttontext: "itunes\nimport"
        buttonicon:  "\uf3b5"
        opacity: 0
        z: 10

        states: [
            State {
                name: "openmenu"
                PropertyChanges {
                    target: _btorigin2
                    anchors.bottomMargin: 250
                    opacity: 1
                }
            },
            State {
                name: "closemenu"
                PropertyChanges {
                    target: _btorigin2
                    anchors.bottomMargin: Constants.bottomMargin
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "openmenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.OutBack;duration: 300 }
                OpacityAnimator {  from: 0; to: 1; duration: 200}
            },
            Transition {
                to: "closemenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.InBack;duration: 300 }
                OpacityAnimator { from: 1; to: 0; duration: 400}
            }
        ]
    }

    ButtonOrigin {
        id: _btorigin3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Constants.bottomMargin //350
        fonttyp: Constants.regular
        buttontext: "camera\nroll"
        buttonicon:  "\uf03e"
        opacity: 0
        z: 10

        states: [
            State {
                name: "openmenu"
                PropertyChanges {
                    target: _btorigin3
                    anchors.bottomMargin: 350
                    opacity: 1
                }
            },
            State {
                name: "closemenu"
                PropertyChanges {
                    target: _btorigin3
                    anchors.bottomMargin: Constants.bottomMargin
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "openmenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.OutBack;duration: 300 }
                OpacityAnimator {  from: 0; to: 1; duration: 200}
            },
            Transition {
                to: "closemenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.InBack;duration: 300 }
                OpacityAnimator { from: 1; to: 0; duration: 400}
            }
        ]
    }

    ButtonOrigin {
        id: _btorigin4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Constants.bottomMargin //450
        fonttyp: Constants.solid
        buttontext: "take a\nphoto"
        buttonicon:  "\uf030"
        opacity: 0
        z: 10

        states: [
            State {
                name: "openmenu"
                PropertyChanges {
                    target: _btorigin4
                    anchors.bottomMargin: 450
                    opacity: 1
                }
            },
            State {
                name: "closemenu"
                PropertyChanges {
                    target: _btorigin4
                    anchors.bottomMargin: Constants.bottomMargin
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "openmenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.OutBack;duration: 300 }
                OpacityAnimator {  from: 0; to: 1; duration: 200}
            },
            Transition {
                to: "closemenu"
                NumberAnimation { properties:"anchors.bottomMargin"; easing.type: Easing.InBack;duration: 300 }
                OpacityAnimator { from: 1; to: 0; duration: 400}
            }
        ]
    }

    Image {
        id: transparentback
        anchors.fill: parent
        source: "images/background_listview2.png"
        fillMode: Image.PreserveAspectFit
        smooth: true
        z:9
    }

    FastBlur {
        id: _fastblurbackground
        anchors.fill: transparentback
        source: transparentback
        radius: 0 //32
        z:9

        states: [
            State {
                name: "openmenu"
                PropertyChanges {
                    target: _fastblurbackground
                    radius: 42
                }
            },
            State {
                name: "closemenu"
                PropertyChanges {
                    target: _fastblurbackground
                    radius: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "openmenu"
                NumberAnimation { properties:"radius"; easing.type: Easing.OutBack;duration: 300 }
            },
            Transition {
                to: "closemenu"
                NumberAnimation { properties:"radius"; easing.type: Easing.InBack;duration: 300 }
            }
        ]
    }
}
