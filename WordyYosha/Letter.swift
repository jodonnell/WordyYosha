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

    func points() -> Int {
        switch self.letter {
        case "A":
            return 2
        case "B":
            return 7
        case "C":
            return 6
        case "D":
            return 5
        case "E":
            return 1
        case "F":
            return 7
        case "G":
            return 7
        case "H":
            return 4
        case "I":
            return 3
        case "J":
            return 8
        case "K":
            return 8
        case "L":
            return 5
        case "M":
            return 6
        case "N":
            return 3
        case "O":
            return 2
        case "P":
            return 7
        case "Q":
            return 10
        case "R":
            return 4
        case "S":
            return 3
        case "T":
            return 2
        case "U":
            return 6
        case "V":
            return 8
        case "W":
            return 7
        case "X":
            return 7
        case "Y":
            return 10
        case "Z":
            return 10
        default:
            println("Should never be here")
            return 0
        }
    }
}

@infix func == (left: Letter, right: Letter) -> Bool {
    return left.id == right.id
}
