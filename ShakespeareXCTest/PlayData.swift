//
//  PlayData.swift
//  ShakespeareXCTest
//
//  Created by Ayuna NYC on 2/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import Foundation

class PlayData {
    
    var allWords = [String]()
    
    var wordCounts: NSCountedSet!
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                allWords = wordCounts.allObjects as! [String]
            }
        }
    }
    
}
