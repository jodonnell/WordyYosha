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
    init(sprite: SKSpriteNode, id: Int) {
        self.sprite = sprite
        self.letter = sprite.children[0].text
        self.id = id
    }

    func isPointIn(point: CGPoint) -> Bool {
        return CGRectContainsPoint(self.sprite.frame, point)
    }

    func moveDown() {
        let moveDownAction = SKAction.moveByX(0.0, y:-self.sprite.frame.size.height - 1, duration:0.3)
        self.sprite.runAction(moveDownAction)
    }

    func y() -> Int {
        return Int(self.sprite.frame.origin.y)
    }
}

@infix func == (left: Letter, right: Letter) -> Bool {
    return left.id == right.id
}
