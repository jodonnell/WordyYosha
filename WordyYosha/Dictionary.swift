//
//  Dictionary.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

class Dictionary {
    let words: String[]

    init() {
        let path = NSBundle.mainBundle().pathForResource("web2", ofType: "txt")
        var possibleContent = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
        
        if let content = possibleContent {
            let array = content.componentsSeparatedByString("\n")
            self.words = array
        }
        else {
            self.words = []
        }
    }

    func isWord(word: String) -> Bool {
        return contains(self.words, PorterStemmer.stemFromString(word))
    }
}
