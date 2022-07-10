//
//  ChannelsUseCaseTests.swift
//  MindvalleyTests
//
//  Created by Mohamed Ramadan on 08/07/2022.
//

import XCTest

@testable import Mindvalley

class ChannelsUseCaseTests: XCTestCase {

    static let newEpisodes: NewEpisodesResponseDTO = {
        let media1 = MediaDTO(type: "new_episode", title: "media1", coverAsset: nil, channel: nil)
        let media2 = MediaDTO(type: "new_episode", title: "media2", coverAsset: nil, channel: nil)
        let media3 = MediaDTO(type: "new_episode", title: "media3", coverAsset: nil, channel: nil)
        
        return NewEpisodesResponseDTO(media: [media1, media2, media3])
    }()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       
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
    
    struct ChannelsRepositoryMock: ChannelsRepository {
        var newEpisodesResult: Result<DataResponseDTO<NewEpisodesResponseDTO>, Error>
        
        func getNewEpisodes(cached: @escaping ([MediaModel]) -> Void, completion: @escaping Response<NewEpisodesResponseDTO>) {
            completion(newEpisodesResult)
        }
        
        func saveNewEpisodes(model: NewEpisodesResponseDTO) {
            
        }
        
        func getChannels(cached: @escaping ([ChannelModel]) -> Void, completion: @escaping Response<ChannelsResponseDTO>) {
            
        }
        
        func saveChannels(model: ChannelsResponseDTO) {
            
        }
        
        func getCetagories(cached: @escaping ([CategoryModel]) -> Void, completion: @escaping Response<CategoriesResponseDTO>) {
            
        }
        
        func saveCetagories(model: CategoriesResponseDTO) {
            
        }
    }
    
    func testChannelsUseCase_whenFetchNewEpisodes_thenNewEpisodesLoaded() {
        // given
        let response = DataResponseDTO(data: ChannelsUseCaseTests.newEpisodes)
        let repository: ChannelsRepository = ChannelsRepositoryMock(newEpisodesResult: .success(response))
        let channelsUSeCase: ChannelsUseCase = DefaultChannelsUseCase(channelsRepository: repository)
        
        let expectation = self.expectation(description: "New episodes saved")
        expectation.expectedFulfillmentCount = 1
         
        // when
        var newEposidesMedia: [MediaModel]?
        _ = channelsUSeCase.getNewEpisodes(completion: { result in
            if case .success(let model) = result {
                newEposidesMedia = model
            }
            expectation.fulfill()
        })
        
        // then
        waitForExpectations(timeout: 5, handler: nil)
        
        // test data loaded
        XCTAssertNotNil(newEposidesMedia)
        XCTAssertTrue(newEposidesMedia![0].title == "media1")
        XCTAssertTrue(newEposidesMedia![1].title == "media2")
        XCTAssertTrue(newEposidesMedia![2].title == "media3")
    }

}
