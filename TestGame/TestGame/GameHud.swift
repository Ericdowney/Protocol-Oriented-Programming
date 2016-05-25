//
//  GameHud.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

// 19 Lines
final class GameHud: SKNode, R2DHud {
    var hudName: String = "GAME_HUD"
    
    func initialize<T : SKScene where T : R2DGameManager>(gameManager: T) {
        self.r2d_addChildren(
            self.createPauseButton(gameManager)
        )
    }
    
    func createPauseButton<T : SKScene where T : R2DGameManager>(manager: T) -> R2DButton {
        let pauseButton = R2DButton(color: .clearColor(), size: CGSize(width: 10, height: 10), text: "||", fontName: "System")
        
        pauseButton.position = R2DUtils.getX(0.1, y: 0.9)
        pauseButton.tapCallback { [weak manager] _ in
            manager?.pauseGame()
        }
        
        return pauseButton
    }
}