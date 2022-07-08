//
//  DefaultChannelsRepositoryImplementer.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

final class DefaultChannelsRepositoryImplementer: ChannelsRepository {
    
    private let channelsStorage : ChannelsResponseStorage
    
    init(channelsStorage : ChannelsResponseStorage = DefaultChannelsCoreDataStorage()) {
        self.channelsStorage = channelsStorage
    }
    
    func getNewEpisodes(cached: @escaping ([MediaModel])->Void,
                        completion: @escaping Response<NewEpisodesResponseDTO>) {
        // load NewEpisodes from cache storage
        self.channelsStorage.getNewEpisodesResponse { result in
            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
        }
        
        // load NewEpisodes from remote service
        EndpointChannels.getNewEpisodes.request(completion: completion)
    }
    
    func saveNewEpisodes(model: NewEpisodesResponseDTO) {
        self.channelsStorage.saveNewEpisodes(responseDTO: model)
    }
    
    func getChannels(cached: @escaping ([ChannelModel])->Void,
                     completion: @escaping Response<ChannelsResponseDTO>) {
        // load Channels from cache storage
        self.channelsStorage.getChannelsResponse { result in
            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
        }
        
        // load Channels from remote service
        EndpointChannels.getChannels.request(completion: completion)
    }
    
    func saveChannels(model: ChannelsResponseDTO) {
        self.channelsStorage.saveChannels(responseDTO: model)
    }
    
    func getCetagories(cached: @escaping ([CategoryModel])->Void,
                       completion: @escaping Response<CategoriesResponseDTO>) {
        // load Cetagories from cache storage
        self.channelsStorage.getCategoriesResponse { result in
            if case let .success(responseDTO?) = result {
                cached(responseDTO.toDomain())
            }
        }
       
        // load Cetagories from remote service
        EndpointChannels.getCetagories.request(completion: completion)
    }
    
    func saveCetagories(model: CategoriesResponseDTO) {
        self.channelsStorage.saveCategories(responseDTO: model)
    }
}

