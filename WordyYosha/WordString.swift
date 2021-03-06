//
//  WordString.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/12/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

class WordString {
    var letters: Letter[] = []

    func canAddLetter(letter: Letter) -> Bool {
        for l in self.letters {
            if letter == l { return false }
        }
        return true
    }

    func createLetter(letter: Letter) -> Letter {
        let newLetter = LetterCreator.createWordString(Point(x: countElements(self.letters), y: 9), letter: letter)
        self.letters.append(newLetter)
        return newLetter
    }

    func isEmpty() -> Bool {
        return self.letters.isEmpty
    }

    func word() -> String {
        var word = ""
        for letter in self.letters {
            word += letter.letter
        }
        return word
    }

    func points() -> Int {
        var sum = 0
        for letter in self.letters {
            sum += letter.points()
        }
        return sum
    }
}
