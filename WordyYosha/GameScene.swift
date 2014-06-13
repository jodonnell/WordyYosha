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
        var lettersArray: Letter[] = []
        for x in (0..8) {
            for y in (0..8) {
                let letter = LetterCreator.create(x: x, y: y)
                lettersArray.append(letter)
            }
        }
        self.letters = Letters(letters: lettersArray)
        self.wordString = WordString()
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        for letter in self.letters.letters {
            self.addChild(letter.sprite)
        }
    }

    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if let letter = self.getLetterFromTouch(touches) {
            if wordString.canAddLetter(letter) {
                let newLetter = wordString.createLetter(letter)
                self.addChild(newLetter.sprite)
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if !self.wordString.isEmpty() { return }
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
        }
        else {
            AudioServicesPlaySystemSound(UInt32(kSystemSoundID_Vibrate))
        }

        self.clearWordString()
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
