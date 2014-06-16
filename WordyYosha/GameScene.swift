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

    init(size: CGSize) {
        self.letters = Letters()
        self.wordString = WordString()
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        for letter in self.letters.letters {
            self.addChild(letter.sprite)
        }
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
            self.removeWord()
            self.beginAnimating()
        }
        else {
            AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
        }

        self.clearWordString()
    }

    func removeWord() {
        self.letters.removeLettersIn(self.wordString.letters)
    }

    func beginAnimating() {
        self.letters.beginAnimating()
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
