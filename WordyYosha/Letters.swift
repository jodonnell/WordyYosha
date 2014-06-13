//
//  Letters.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/12/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation
import SpriteKit

class Letters {
    var letters: Letter[]
    init() {
        self.letters = []
        for x in (0..8) {
            for y in (0..8) {
                let letter = LetterCreator.create(x: x, y: y)
                self.letters.append(letter)
            }
        }
    }

    func findLetterAtLocation(location: CGPoint) -> Letter? {
        for letter in self.letters {
            if letter.isPointIn(location) {
                return letter
            }
        }
        return nil
    }

    func removeLettersIn(word: Letter[]) {
        for letter in word {
            for var i = countElements(self.letters) - 1; i >= 0; i-- {
                let boardLetter = self.letters[i]
                if letter == boardLetter {
                    boardLetter.sprite.removeFromParent()
                    self.letters.removeAtIndex(i)
                }
            }
        }
    }

    func beginAnimating() {
        for letter in self.letters {
            if self.isAtBottom(letter) { continue }
            // is there a letter underneath?
            // if not move down
            var point = letter.sprite.frame.origin
            point.y -= letter.sprite.frame.size.height - 1
            point.x += 10
            if !self.findLetterAtLocation(point) {
                letter.moveDown()
            }
        }
    }
    func isAtBottom(letter: Letter) -> Bool {
        println(letter.y())
        return letter.y() == 10 // padding
    }
}
