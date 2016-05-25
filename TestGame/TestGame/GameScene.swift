//
//  GameScene.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright (c) 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

let playerCategory: UInt32 = 0x1 << 0
let platformCategory: UInt32 = 0x1 << 1

// 80 Lines
final class GameScene: SKScene, R2DGameManager {
    
    var hudManager: HudManager = HudManager()
    
    var gameHudName: String = "GAME_HUD"
    var pauseHudName: String = "PAUSE_HUD"
    var gameOverHudName: String = "GAME_OVER_HUD"
    
    var score: Int = 0
    
    var player: Player? = nil
    var platformSpawner: PlatformSpawner? = nil
    
    // Mark: - Game Manager
    
    func startGame() {
        self.platformSpawner?.startSpawning()
    }
    
    func reset() {
        self.score = 0
        self.player?.resetPlayer()
        self.hudManager.switchToHud(self.gameHudName)
    }
    
    // MARK: - SKScene
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        self.setupScene()
        self.r2d_addChildren( self.hudManager.initialize(self).flatMap { $0 as? SKNode } )
        self.setupPhysicsWorld()
        self.reset()
        self.startGame()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    // MARK: - Setup
    
    func setupScene() {
        let aPlayer = Player.createPlayer()
        let spawner = PlatformSpawner()
        
        self.player = aPlayer
        self.platformSpawner = spawner
        
        self.r2d_addChildren(
            aPlayer,
            spawner,
            self.createGround()
        )
    }
    
    func createGround() -> SKSpriteNode {
        let size = CGSize(width: R2DUtils.screenWidth, height: 25.0)
        let ground = Platform(color: .redColor(), size: size)
        
        ground.r2dAnchor = .BottomLeft
        ground.position = R2DUtils.getX(0.0, y: 0.0)
        
        return ground
    }
    
    // MARK: - Physics Delegate
    
    func didBeginContact(contact: SKPhysicsContact) {
        self.beginPhysicsContact(contact)
    }
    
    // MARK: - Touches
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        self.player?.jump()
    }
}
