//
//  DefaultChannelsRepositoryImplementer.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

final class DefaultChannelsRepositoryImplementer: ChannelsRepository {
    func getNewEpisodes(completion: @escaping Response<NewEpisodesResponseDTO>) {
        EndpointChannels.getNewEpisodes.request(completion: completion)
    }
    
    func getChannels(completion: @escaping Response<ChannelsResponseDTO>) {
        EndpointChannels.getChannels.request(completion: completion)
    }
    
    func getCetagories(completion: @escaping Response<CategoriesResponseDTO>) {
        EndpointChannels.getCetagories.request(completion: completion)
    }
}

