import VPlay 2.0
import QtQuick 2.0

import "entities"

GameWindow {
    id: gameWindow

    onSplashScreenFinished: {
        console.debug("### Splash screen finished")
    }

    BalloonScene {
    }
}

