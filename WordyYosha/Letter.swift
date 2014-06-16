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
}

@infix func == (left: Letter, right: Letter) -> Bool {
    return left.id == right.id
}
