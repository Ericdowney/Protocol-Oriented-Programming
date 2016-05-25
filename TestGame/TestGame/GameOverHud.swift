//
//  GameOverHud.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

final class GameOverHud: SKNode, R2DHud {
    var hudName: String = "GAME_OVER_HUD"
    
    func initialize<T : SKScene where T : R2DGameManager>(gameManager: T) {
        
    }
}