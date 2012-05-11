// "THE BEER-WARE LICENSE" (Revision 42):
// Rodrigo 'Skhaz' Delduca wrote this file. As long as you retain this notice you
// can do whatever you want with this stuff. If we meet some day, and you think
// this stuff is worth it, you can buy me a beer
//
// based on http://www.professorcloud.com/mainsite/canvas-nebula.htm

import QtQuick 1.1

Rectangle {
    width: 570
    height: 570
    color: "black"

    Repeater {
        id: repeater
        model: 8

        Rectangle {
            id: rect

            visible: false
            color: "transparent"
            clip: true

            width: 285; height: 285
            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2

            Timer {
                id: timer
                interval: 500 * index
                running: true
                repeat: false
                onTriggered: {
                    rect.visible = true
                    animation.running = true
                }
            }

            Image {
                source: "nebula.jpg"
                smooth: true
                x: -1 * (Math.random() * 285) >> 0
                y: -1 * (Math.random() * 285) >> 0
            }

            ParallelAnimation {
                id: animation
                running: false
                loops: Animation.Infinite

                SequentialAnimation {
                    NumberAnimation {
                        target: rect
                        property: "opacity"
                        from: .0; to: 1.0
                        duration: 3000
                    }

                    NumberAnimation {
                        target: rect
                        property: "opacity"
                        from: 1.0; to: .0
                        duration: 500
                    }
                }

                NumberAnimation {
                    target: rect
                    property: "scale"
                    from: 2.0; to: 4.0
                    duration: 4000
                }
            }
        }
    }
}

