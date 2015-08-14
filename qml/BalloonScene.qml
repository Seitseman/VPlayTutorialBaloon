import VPlay 2.0
import QtQuick 2.0

import "entities"

Scene {
    id: baloonScene
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
        source: "../assets/snd/balloonPop.mp3"
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
        width: parent.width
        anchors.bottom: parent.top
    }
}

