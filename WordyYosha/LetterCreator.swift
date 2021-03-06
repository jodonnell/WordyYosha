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

let boxWidth = 36
let boxHeight = 39
let boxWidthWithPadding = boxWidth + 1
let padding = 30

class LetterCreator {

    class func create(point: Point) -> BoardLetter {
        let label = self.createLetterSprite(self.randomLetter(), fontSize: 20, point: CGPoint(x: 0, y: -15))
        let box = self.createBox(SKColor.greenColor(), point: point, label: label)
        let boardLetter = BoardLetter(sprite: box, id: self.newId(), point: point)

        let myLabel = self.createLetterSprite(String(boardLetter.points()), fontSize: 12, point: CGPoint(x: 10, y: 8))
        box.addChild(myLabel)
        return boardLetter
    }

    class func createWithLetter(point: Point, letter: String) -> BoardLetter {
        let label = self.createLetterSprite(letter, fontSize: 20, point: CGPoint(x: 0, y: -15))
        let box = self.createBox(SKColor.greenColor(), point: point, label: label)
        return BoardLetter(sprite: box, id: self.newId(), point: point)
    }

    class func createWordString(point: Point, letter: Letter) -> Letter {
        let label = self.createLetterSprite(letter.letter, fontSize: 37, point: CGPoint(x: 0, y: -15))
        let box = self.createBox(SKColor.yellowColor(), point: point, label: label)
        return Letter(sprite: box, id: letter.id)
    }

    class func createBox(color: SKColor, point: Point, label: SKLabelNode) -> SKSpriteNode {
        let box = SKSpriteNode(color: color, size: self.boxSize())
        box.position = CGPoint(x: point.x * boxWidthWithPadding + padding, y: point.y * (boxWidthWithPadding + 3) + padding)
        box.addChild(label)
        return box
    }
    
    class func createLetterSprite(letter: String, fontSize: Int, point: CGPoint) -> SKLabelNode {
        let myLabel = SKLabelNode(fontNamed:"Al Nile")
        myLabel.text = letter
        myLabel.fontSize = CGFloat(fontSize)
        myLabel.fontColor = SKColor.blackColor()
        myLabel.position = point
        return myLabel
    }

    class func boxSize() -> CGSize {
        return CGSizeMake(CGFloat(boxWidth), CGFloat(boxHeight))
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
