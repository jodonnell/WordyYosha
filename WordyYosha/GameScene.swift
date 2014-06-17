//
//  GameScene.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import SpriteKit
import AudioToolbox

class GameScene: SKScene {
    var letters: Letters
    var wordString: WordString
    let playerOneScore: SKLabelNode
    let playerTwoScore: SKLabelNode
    var player: Int
    
    init(size: CGSize) {
        self.letters = Letters()
        self.wordString = WordString()

        self.playerOneScore = SKLabelNode(fontNamed:"Al Nile")
        self.playerOneScore.text = "0"
        self.playerOneScore.fontSize = 50
        self.playerOneScore.fontColor = SKColor.whiteColor()
        self.playerOneScore.position = CGPoint(x: 50, y: 500)

        self.playerTwoScore = SKLabelNode(fontNamed:"Al Nile")
        self.playerTwoScore.text = "0"
        self.playerTwoScore.fontSize = 50
        self.playerTwoScore.fontColor = SKColor.whiteColor()
        self.playerTwoScore.position = CGPoint(x: 260, y: 500)

        self.player = 1
        
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        for letter in self.letters.letters {
            self.addChild(letter.sprite)
        }

        self.addChild(self.playerOneScore)
        self.addChild(self.playerTwoScore)
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        self.checkForNewLetter(touches)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if !self.wordString.isEmpty() { return }
        self.checkForNewLetter(touches)
    }

    func checkForNewLetter(touches: NSSet) {
        if let letter = self.getLetterFromTouch(touches) {
            if wordString.canAddLetter(letter) {
                let newLetter = wordString.createLetter(letter)
                self.addChild(newLetter.sprite)
            }
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let dictionary = Dictionary()
        if dictionary.isWord(self.wordString.word()) {
            if player == 1 {
                self.playerOneScore.text = String(self.playerOneScore.text.toInt()! + self.wordString.points())
                player = 2
            }
            else {
                self.playerTwoScore.text = String(self.playerTwoScore.text.toInt()! + self.wordString.points())
                player = 1
            }
            self.removeWord()
            self.letters.fall()
            self.addNewLetters()
        }
        else {
            AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
        }

        self.clearWordString()
    }

    func addNewLetters() {
        for letter in self.letters.letters {
            if !letter.sprite.parent {
                self.addChild(letter.sprite)
            }
        }
    }
    
    func removeWord() {
        self.letters.removeLettersIn(self.wordString.letters)
    }

    func clearWordString() {
        for letter in self.wordString.letters {
            letter.sprite.removeFromParent()
        }

        self.wordString = WordString()
    }
    
    func getLetterFromTouch(touches: NSSet) -> Letter? {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let letter = self.letters.findLetterAtLocation(location)
            return letter
        }
        return nil
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
