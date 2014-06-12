//
//  GameScene.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        for x in (0..8) {
            for y in (0..8) {
                self.addChild(LetterCreator.create(x: x, y: y))
            }
        }

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            // let location = touch.locationInNode(self)
            
            // let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            // sprite.xScale = 0.5
            // sprite.yScale = 0.5
            // sprite.position = location
            
            // let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            // sprite.runAction(SKAction.repeatActionForever(action))
            
            // self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
