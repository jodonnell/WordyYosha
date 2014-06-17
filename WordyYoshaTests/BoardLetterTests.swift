//
//  BoardLetterTests.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/16/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import XCTest
import SpriteKit

class BoardLetterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIsPointIn() {
        let boardLetter = LetterCreator.create(Point(x: 0, y: 0))

        let validX = 22.0
        let validY = 21.0
        let validXRight = validX + 36.0 - 11
        let validYBottom = validY + 39.0 - 11
        
        XCTAssertFalse(boardLetter.isPointIn(CGPointMake(validX - 1, validY)))
        XCTAssertFalse(boardLetter.isPointIn(CGPointMake(validX, validY - 1)))
        XCTAssert(boardLetter.isPointIn(CGPointMake(validX, validY)))

        XCTAssertFalse(boardLetter.isPointIn(CGPointMake(validXRight + 1, validYBottom )))
        XCTAssertFalse(boardLetter.isPointIn(CGPointMake(validXRight , validYBottom + 1)))
        XCTAssert(boardLetter.isPointIn(CGPointMake(validXRight, validYBottom)))
    }

    func testScoreForLetter() {
        let boardLetter = LetterCreator.createWithLetter(Point(x: 0, y: 0), letter: "B")
        XCTAssertEqual(boardLetter.points(), 7)
    }
}
