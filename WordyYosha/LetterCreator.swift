//
//  LetterCreator.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/12/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation
import SpriteKit

var id = 0
class LetterCreator {

    class func create(#x: Int, y: Int) -> Letter {
        let myLabel = SKLabelNode(fontNamed:"Al Nile")
        myLabel.text = self.randomLetter()
        let fontSize = 37
        let padding = 30
        myLabel.fontSize = CGFloat(fontSize)
        myLabel.position = CGPoint(x: x * fontSize + padding, y: y * (fontSize + 3) + padding)
        
        return Letter(sprite: myLabel, id: self.newId())
    }

    class func createWordString(#x: Int, y: Int, letter: Letter) -> Letter {
        let myLabel = SKLabelNode(fontNamed:"Al Nile")
        myLabel.text = letter.letter
        let fontSize = 37
        let padding = 30
        myLabel.fontSize = CGFloat(fontSize)
        myLabel.position = CGPoint(x: x * fontSize + padding, y: y * (fontSize + 3) + padding)
        
        return Letter(sprite: myLabel, id: letter.id)
    }

    class func newId() -> Int {
        id++
        return id
    }
    
    class func randomLetter() -> String {
        let cower = arc4random() % 100000
        if cower < 8167 { return "A" }
        if cower < 9659 { return "B" }
        if cower < 12441 { return "C" }
        if cower < 16694 { return "D" }
        if cower < 29694 { return "E" }
        if cower < 31922 { return "F" }
        if cower < 33937 { return "G" }
        if cower < 40031 { return "H" }
        if cower < 46997 { return "I" }
        if cower < 47150 { return "J" }
        if cower < 47922 { return "K" }
        if cower < 51947 { return "L" }
        if cower < 54353 { return "M" }
        if cower < 61102 { return "N" }
        if cower < 68609 { return "O" }
        if cower < 70538 { return "P" }
        if cower < 70633 { return "Q" }
        if cower < 76620 { return "R" }
        if cower < 82947 { return "S" }
        if cower < 92003 { return "T" }
        if cower < 94761 { return "U" }
        if cower < 95739 { return "V" }
        if cower < 98099 { return "W" }
        if cower < 98249 { return "X" }
        if cower < 99930 { return "Y" }
        return "Z"
    }
}
