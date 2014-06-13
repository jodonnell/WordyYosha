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
        let lowercaseWord = word.lowercaseString
        let checker = UITextChecker()
        let currentLocale = NSLocale.currentLocale()
        let currentLanguage = currentLocale!.objectForKey(NSLocaleLanguageCode) as String
        let searchRange = NSMakeRange(0, countElements(lowercaseWord))

        let misspelledRange = checker.rangeOfMisspelledWordInString(lowercaseWord, range: searchRange, startingAt:0, wrap:false, language: currentLanguage)

        if misspelledRange.location == NSNotFound { return true }
        return false
    }
}
