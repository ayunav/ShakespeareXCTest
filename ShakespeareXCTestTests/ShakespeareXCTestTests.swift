//
//  ShakespeareXCTestTests.swift
//  ShakespeareXCTestTests
//
//  Created by Ayuna NYC on 2/9/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import XCTest
@testable import ShakespeareXCTest

class ShakespeareXCTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18440, "all words must be 18440")
    }
    
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "BOTTOM"), 55, "BOTTOM does not appear 55 times")
        XCTAssertEqual(playData.wordCounts.count(for: "swearing"), 10, "swearing does not appear 10 times")
    }
    

    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    
    func testUserFilterWorks() {
        let playData = PlayData()
        
        playData.applyUserFilter("play")
        XCTAssertEqual(playData.filteredWords.count, 15, "the word count for play is not 15")
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495, "the word count for 100 is not 495")
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55, "the word count for 1000 is not 55")
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1, "the word count for 10000 is not 1")
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56, "the word count for test is not 56")
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7, "the word count for swift is not 7")
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0, "the word count for objective-c is not 0")
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            _ = PlayData()
//        }
//    }
    
}
