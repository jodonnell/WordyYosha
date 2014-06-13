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
    let letters: Letter[]
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
}
