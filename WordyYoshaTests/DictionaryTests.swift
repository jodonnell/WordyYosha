//
//  DictionaryTests.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import XCTest

class DictionaryTests: XCTestCase {
    //var dictionary: Dictionary
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // https://github.com/itfrombit/PorterStemmer
        let dictionary = Dictionary()
        XCTAssertTrue(dictionary.isWord("power"))
        XCTAssertTrue(dictionary.isWord("powers"))
        XCTAssertFalse(dictionary.isWord("powerbutts"))
    }
}