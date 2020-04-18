//
//  GameScene.swift
//  SprikeKitDemo
//
//  Created by Damir Lutfullin on 18.04.2020.
//  Copyright © 2020 DamirLutfullin. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        let sprite = SKSpriteNode(color: .green, size: CGSize(width: 300, height: 300))
        
        self.addChild(sprite)
        
        let spaceShip = SKSpriteNode(imageNamed: "Spaceship")
        spaceShip.position = CGPoint(x: self.size.width, y: self.size.height)
        spaceShip.setScale(0.3)
        self.addChild(spaceShip)
        
        let movePoint = CGPoint(x: -self.size.width, y: -self.size.height)
        let moveSpaceShip = SKAction.move(to: movePoint, duration: 5)
        moveSpaceShip.speed = 1
        moveSpaceShip.timingMode = .easeOut
        
        
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        
        let fadeOutFadeInSequence = SKAction.sequence([fadeOutAction, fadeInAction])
        let repaetSequence = SKAction.repeat(fadeOutFadeInSequence, count: Int(moveSpaceShip.duration / fadeOutFadeInSequence.duration))
        let groupAction = SKAction.group([repaetSequence, moveSpaceShip])
        spaceShip.run(groupAction)
        
//        spaceShip.run(moveSpaceShip)
//        spaceShip.run(SKAction.repeat(fadeOutFadeInSequence, count: Int(moveSpaceShip.duration / fadeOutFadeInSequence.duration)) )
//
    }
}
