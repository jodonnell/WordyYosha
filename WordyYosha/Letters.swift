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
    let numBoardRows = 16
    let numBoardVisibleRows = 8
    let numBoardColumns = 8
    init() {
        self.letters = []
        for x in (0..numBoardColumns) {
            for y in (0..numBoardRows) {
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

    func fall() {
        for y in (1..numBoardRows) {
            for x in (0..numBoardColumns) {
                for letter in self.letters {
                    if Point(x: x, y: y) == letter.position {
                        letter.moveDown(self.moveDownRows(letter))
                        break
                    }
                }
            }
        }
        self.createNewLetters()
    }

    func createNewLetters() {
        for x in (0..numBoardColumns) {
            for y in (0..numBoardRows) {
                if !self.findLetter(Point(x: x, y: y)) {
                    self.createNewLettersInRow(numBoardRows - y, row: x)
                    break
                }
            }
        }
        
    }

    func createNewLettersInRow(numLetters: Int, row: Int) {
        let startCreateY = numBoardRows - numLetters
        for y in startCreateY..numBoardRows {
            let letter = LetterCreator.create(x: row, y: y)
            self.letters.append(letter)
        }
    }
    
    func moveDownRows(letter: BoardLetter) -> Int {
        for y in (0..letter.position.y) {
            let point = Point(x: letter.position.x, y: y)
            if !self.findLetter(point) {
                return abs(y - letter.position.y)
            }
        }
        return 0
    }

    func findLetter(point: Point) -> Letter? {
        for letter in self.letters {
            if point == letter.position {
                return letter
            }
        }
        return nil
    }
}
