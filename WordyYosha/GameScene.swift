//
//  GameScene.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var letters: Letters

    init(size: CGSize) {
        var lettersArray: Letter[] = []
        for x in (0..8) {
            for y in (0..8) {
                let letter = LetterCreator.create(x: x, y: y)
                lettersArray.append(letter)
            }
        }
        self.letters = Letters(letters: lettersArray)
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        for letter in self.letters.letters {
            self.addChild(letter.sprite)
        }
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let letter = self.letters.findLetterAtLocation(location)
            if let realLetter = letter {
                println(realLetter.letter)
            }
            else { println("nothing") }
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
