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
    private(set) var filteredWords = [String]()
    
    var wordCounts: NSCountedSet!
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { (by: wordCounts.count(for: $0) > wordCounts.count(for: $1)) }
                allWords = sorted as! [String]
            }
        }
        
        applyUserFilter("swift")
    }
    
    
    func applyUserFilter(_ input: String) {
        if let inputNumber = Int(input) {
            applyFilter { self.wordCounts.count(for: $0) >= inputNumber}
        } else {
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
}
