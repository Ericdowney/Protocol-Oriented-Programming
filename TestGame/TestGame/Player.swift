//
//  Player.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

// 41 Lines
final class Player: SKSpriteNode, R2DPlayer, R2DMultiJump, R2DGameComponent {
    
    // MARK: - R2DInfiniteJump
    
    var numberOfJumps: Int = 2
    var jumpImpluse: CGFloat = 20.0
    var jumpCount: Int = 0
    
    // MARK: - R2DPlayer
    
    weak var delegate: R2DPlayerDeathDelegate? = nil
    var inventory: [R2DInventoryItem] = []
    var health: Int = 1
    
    func updatePlayer(currentTime: CFTimeInterval) {}
    
    func resetPlayer() {
        self.health = 1
        self.resetJump()
    }
    
    func updateCollision(contact: SKPhysicsContact, gameManager: R2DGameManagerComponent) {
        self.resetJump()
    }
    
    // MARK: - Create
    
    class func createPlayer() -> Player {
        let size = CGSize(width: 25, height: 25)
        let aPlayer = Player(color: .blueColor(), size: size)
        
        aPlayer.position = R2DUtils.getX(0.5, y: 0.5)
        
        aPlayer.r2d_physicsBodyFromSize(size)
        aPlayer.physicsBody?.allowsRotation = false
        
        aPlayer.physicsBody?.categoryBitMask = playerCategory
        aPlayer.physicsBody?.collisionBitMask = platformCategory
        
        return aPlayer
    }
}