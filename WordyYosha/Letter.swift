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
    let sprite: SKLabelNode
    let letter: String
    let id: Int
    init(sprite: SKLabelNode, id: Int) {
        self.sprite = sprite
        self.letter = sprite.text
        self.id = id
    }

    func isPointIn(point: CGPoint) -> Bool {
        return CGRectContainsPoint(self.sprite.frame, point)
    }
}

@infix func == (left: Letter, right: Letter) -> Bool {
    return left.id == right.id
}
