import QtQuick 2.0
import VPlay 2.0

EntityBase {
    entityType: "balloon"

    CircleCollider {
        radius: sprite.width/2
        anchors.centerIn: parent

        fixture.restitution: 0.5
    }

    MultiResolutionImage {
        id: sprite
        source: "../../assets/img/balloon.png"
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: sprite
    }

    Component.onCompleted: {
        x = utils.generateRandomValueBetween(15, balloonScene.width - 15)
        y = balloonScene.height
    }
}
