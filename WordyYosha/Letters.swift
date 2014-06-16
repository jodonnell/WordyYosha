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
    var letters: BoardLetter[]
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
        for y in (1..8) {
            for x in (0..8) {
                for letter in self.letters {
                    if Point(x: x, y: y) == letter.position {
                        let moveDown = self.findLowestHole(letter)
                        letter.moveDown(moveDown)
                        break
                    }
                }
            }
        }
    }

    func findLowestHole(letter: BoardLetter) -> Int {
        let point = Point(x: letter.position.x, y: letter.position.y - 1)
        var found = false
        for letter in self.letters {
            if point == letter.position {
                found = true
            }
        }

        if !found {
            return 1
        }
        return 0
    }
}
