//
//  Letter.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/12/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation
import SpriteKit

class Letter {
    let sprite: SKSpriteNode
    let letter: String
    let id: Int
    var position: CGPoint?
    
    init(sprite: SKSpriteNode, id: Int, point: CGPoint?) {
        self.sprite = sprite
        self.letter = sprite.children[0].text
        self.id = id
        self.position = point
    }

    func isPointIn(point: CGPoint) -> Bool {
        return CGRectContainsPoint(self.sprite.frame, point)
    }

    func moveDown(number: Int) {
        if number == 0 { return }
        self.position = CGPointMake(self.position!.x, self.position!.y - CGFloat(number))


        let moveDownY = Float(-self.sprite.frame.size.height - 1) * Float(number)
        let duration = 0.3 * Float(number)
        let moveDownAction = SKAction.moveByX(0.0, y: CGFloat(moveDownY), duration: CGFloat(duration))
        self.sprite.runAction(moveDownAction)
    }
}

@infix func == (left: Letter, right: Letter) -> Bool {
    return left.id == right.id
}
