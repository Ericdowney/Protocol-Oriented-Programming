//
//  Platform.swift
//  TestGame
//
//  Created by Downey, Eric on 5/24/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

// 20 Lines
final class Platform: SKSpriteNode, R2DScrolling, R2DGameComponent {
    var scrollDirection: R2DDirection = .Left
    var scrollSpeed: CGFloat = 5.0
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let body = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        self.r2d_physicsBody(body)
        
        self.physicsBody?.dynamic = false
        self.physicsBody?.categoryBitMask = platformCategory
        self.physicsBody?.contactTestBitMask = playerCategory
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCollision(contact: SKPhysicsContact, gameManager: R2DGameManagerComponent) {}
}