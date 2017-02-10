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
        XCTAssertEqual(playData.wordCounts["home"], 174, "home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts["BOTTOM"], 55, "BOTTOM does not appear 55 times")
        XCTAssertEqual(playData.wordCounts["swearing"], 10, "swearing does not appear 10 times")
    }
    
    
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = PlayData()
        }
    }
    
}
