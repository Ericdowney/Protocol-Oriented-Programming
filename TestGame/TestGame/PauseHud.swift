//
//  PauseHud.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

// 19 Lines
final class PauseHud: SKNode, R2DHud {
    var hudName: String = "PAUSE_HUD"
    
    func initialize<T : SKScene where T : R2DGameManager>(gameManager: T) {
        self.r2d_addChildren(
            self.createResumeButton(gameManager)
        )
    }
    
    func createResumeButton<T : SKScene where T : R2DGameManager>(manager: T) -> R2DButton {
        let resumeButton = R2DButton(color: .clearColor(), size: CGSize(width: 10, height: 10), text: "Resume", fontName: "System")
        
        resumeButton.position = R2DUtils.getX(0.5, y: 0.5)
        resumeButton.tapCallback { [weak manager] _ in
            manager?.resumeGame()
        }
        
        return resumeButton
    }
}