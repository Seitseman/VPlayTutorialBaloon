import VPlay 2.0
import QtQuick 2.0

import "entities"

Scene {

    id: balloonScene
    property alias popSound: popSound
    property int balloons: 0
    property int balloonsMax: 100
    property int time: 20
    property bool gameRunning: false

    sceneAlignmentY: "top"

    EntityManager {
        id: entityManager
        entityContainer: balloonScene
    }

    PhysicsWorld {
        z:1
        gravity.y: 1
    }

    Image {
        source: "../assets/img/clouds.png"
        anchors.fill: gameWindowAnchorItem
    }

    SoundEffectVPlay {
        id: popSound
        source: "../assets/snd/balloonPop.wav"
    }

    BackgroundMusic {
        source: "../assets/snd/music.mp3"
    }

    //left wall
    Wall {
        height: parent.height + 50
        anchors.right: parent.left
    }

    //right wall
    Wall {
        height: parent.height + 50
        anchors.left: parent.right
    }

    // ceiling
    Wall {
       width: balloonScene.gameWindowAnchorItem.width
        anchors.bottom: parent.top
    }

    Timer {
        id: balloonTimer
        interval: 20
        running: true
        repeat: true
        onTriggered: {
            entityManager.createEntityFromUrl(
                        Qt.resolvedUrl("entities/Balloon.qml"))
            balloons++

            if (balloons === balloonsMax) {
                running = false
                gameRunning = true
                infoText.text = qsTr("Hurry!")
            }
        }
    }

    Timer {
        id: gameTimer
        running: gameRunning
        repeat: true
        onTriggered: {
            time--
            if (time === 0 || balloons === 0) {
                gameRunning = false
                if (balloons === 0) {
                    infoText.text = qsTr("Perfect, take a cookie!")
                }
                else if (balloons < balloonsMax/2) {
                    infoText.text = qsTr("Well, that was decent...")
                }
                else {
                    infoText.text = qsTr("Not your day. Doh!")
                }
            }
        }
    }

    //HUD
    Row {
        anchors.bottom: parent.bottom
        z:2
        Text {
            id: infoText
            width: 200
            height: 40
            text: qsTr("Loading balloons...")
        }
        Text {
            id: timeText
            height: 40
            text: qsTr("Time:") + balloonScene.time
        }
    }

}

