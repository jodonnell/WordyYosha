//
//  Dictionary.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

class Dictionary {
    func isWordIn(word: String) -> Bool {
        let path = NSBundle.mainBundle().pathForResource("web2", ofType: "txt")
        var possibleContent = String.stringWithContentsOfFile(path, encoding: NSUTF8StringEncoding, error: nil)
        
        if let content = possibleContent {
            var array = content.componentsSeparatedByString("\n")
            return contains(array, PorterStemmer.stemFromString(word))
        }
        
        return false
    }
}