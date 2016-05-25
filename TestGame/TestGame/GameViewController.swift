//
//  GameViewController.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright (c) 2016 Eric Downey. All rights reserved.
//

import UIKit
import SpriteKit

// Entire Game - 245 Lines
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        let scene = GameScene(size: skView.frame.size)
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        skView.showsPhysics = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
