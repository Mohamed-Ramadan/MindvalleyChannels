//
//  ChannelsUseCaseTests.swift
//  MindvalleyTests
//
//  Created by Mohamed Ramadan on 08/07/2022.
//

import XCTest

@testable import Mindvalley

class ChannelsUseCaseTests: XCTestCase {

    var channelsUSeCase: ChannelsUseCase!
    var repository: ChannelsRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = DefaultChannelsRepositoryImplementer()
        channelsUSeCase = DefaultChannelsUseCase(channelsRepository: repository)
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
    
    func test_fetchPhotosOfPageOne() {
        // arrange
        
        
        // Act
        channelsUSeCase.getChannels { result in
            switch result {
                case .success(let photos):
                    
                    // Assert
                    XCTAssertNotNil(photos, "Channels is Nil")
                    break
                case .failure(let error):
                    // Assert
                    XCTAssertNotNil(error, "Error is Nil")
                    break
            }
        }

    }

}
