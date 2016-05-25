//
//  HudManager.swift
//  TestGame
//
//  Created by Downey, Eric on 5/23/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import R2DEngine

// 6 Lines
final class HudManager: R2DHudManager {
    var hudComponents: [R2DHud] = [
        GameHud(),
        PauseHud(),
        GameOverHud()
    ]
}