//
//  ChannelsViewModelTests.swift
//  MindvalleyTests
//
//  Created by Mohamed Ramadan on 09/07/2022.
//

import XCTest

@testable import Mindvalley

class ChannelsViewModelTests: XCTestCase {
 
    private var channeclsViewModel: ChannelsViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        channeclsViewModel = ChannelsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
 

    // Test initialization of NewEpisode not nil and empty
    func test_initNewEpisodes() {
        let newEpisodes = channeclsViewModel.newEpisodes
        XCTAssertNotNil(newEpisodes)
        XCTAssertTrue(newEpisodes.isEmpty)
    }
    
    // Test initialization of Channels not nil and empty
    func test_initChannels() {
        let channels = channeclsViewModel.channels
        XCTAssertNotNil(channels)
        XCTAssertTrue(channels.isEmpty)
    }
    
    
    // Test initialization of medias not nil and empty
    func test_initChannelss() {
        let medias = channeclsViewModel.medias
        XCTAssertNotNil(medias)
        XCTAssertTrue(medias.isEmpty)
    }
    
    
}

