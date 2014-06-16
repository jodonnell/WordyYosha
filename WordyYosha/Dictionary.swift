//
//  Dictionary.swift
//  WordyYosha
//
//  Created by Jacob O'Donnell on 6/11/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation
import UIKit

class Dictionary {
    func isWord(word: String) -> Bool {
        if countElements(word) < 3 { return false }

        let lowercaseWord = word.lowercaseString
        let searchRange = NSMakeRange(0, countElements(lowercaseWord))
        let misspelledRange = UITextChecker().rangeOfMisspelledWordInString(lowercaseWord, range: searchRange, startingAt:0, wrap:false, language: self.currentLanguage())

        return misspelledRange.location == NSNotFound
    }

    func currentLocale() -> NSLocale {
        return NSLocale.currentLocale()        
    }

    func currentLanguage() -> String {
        return self.currentLocale().objectForKey(NSLocaleLanguageCode) as String
    }
    
}
