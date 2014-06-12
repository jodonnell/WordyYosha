//
//  DictionaryTests.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import XCTest

class DictionaryTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSpellChecker() {
        let dictionary = Dictionary()
        XCTAssertTrue(dictionary.isWord("power"))
        XCTAssertTrue(dictionary.isWord("powers"))
        XCTAssertFalse(dictionary.isWord("powerbutts"))
        XCTAssertFalse(dictionary.isWord("toxicing"))
    }
}
