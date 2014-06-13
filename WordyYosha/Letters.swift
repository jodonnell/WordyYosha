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
    init(letters: Letter[]) {
        self.letters = letters
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
            letter.moveDown()
        }
    }
}
