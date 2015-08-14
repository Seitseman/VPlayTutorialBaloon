import VPlay 2.0
import QtQuick 2.0

GameWindow {
    id: gameWindow

    onSplashScreenFinished: {
        console.debug("### Splash screen finished")
    }

    BalloonScene {
        id: balloonScene
    }
}

