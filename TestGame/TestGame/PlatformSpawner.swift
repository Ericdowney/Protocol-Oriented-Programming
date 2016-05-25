//
//  PlatformSpawner.swift
//  TestGame
//
//  Created by Downey, Eric on 5/24/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
import R2DEngine

// 60 Lines
final class PlatformSpawner: SKNode, R2DSpawner {
    
    var minimumSpawnTime: NSTimeInterval = 1.0
    var maximumSpawnTime: NSTimeInterval = 5.0
    var spawnType: R2DSpawnerType = .Cos
    var spawnNodes: R2DSpawnerFunc = {_ in []}
    var seed: Int = 0
    
    override init() {
        super.init()
        
        self.spawnNodes = self.spawn
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Spawner Functions
    
    func spawnAction() {
        self.spawn().flatMap {
            $0 as? Platform
        }.forEach {
            self.addChild($0)
            $0.startScrollingForever()
        }
    }
    
    private func spawn(seed: Int, spawnType: R2DSpawnerType) -> [R2DScrolling] {
        var y: CGFloat = 0
        switch spawnType {
            case .Tan: y = abs( round( tan(CGFloat(seed)) * 200 ) )
            case .Cos: y = abs( round( cos(CGFloat(seed)) * 200 ) )
            case .Sin: y = abs( round( sin(CGFloat(seed)) * 200 ) )
        }
        if y <= 18 { y += 18 }
        
        let width: CGFloat = CGFloat(arc4random_uniform(UInt32(R2DUtils.getX(1.0)/2)) + UInt32(R2DUtils.getX(1.0)/8))
        let platform = Platform(color: .greenColor(), size: CGSize(width: width, height: 3.0))
        
        platform.r2dAnchor = .BottomLeft
        platform.position = CGPoint(x: R2DUtils.getX(1.0), y: y)
        platform.zPosition = 10
        
        return [platform]
    }
    
    func updateSpawnNodes(currentTime: CFTimeInterval) {
        let toBeRemoved = self.children.flatMap {
            $0 as? SKSpriteNode
        }.filter {
            $0.position.x + $0.size.width < 0
        }
        
        toBeRemoved.forEach {
            $0.removeFromParent()
        }
        self.removeChildrenInArray(toBeRemoved)
    }
}
