//
//  ChannelsUseCase.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation
 
protocol ChannelsUseCase {
    func getNewEpisodes(completion: @escaping (Result<[MediaModel], Error>) -> Void)
    func getChannels(completion: @escaping (Result<[ChannelModel], Error>) -> Void)
    func getCetagories(completion: @escaping (Result<[CategoryModel], Error>) -> Void)
}

final class DefaultChannelsUseCase: ChannelsUseCase {
     
    private let channelsRepository: ChannelsRepository
    
    init(channelsRepository: ChannelsRepository = DefaultChannelsRepositoryImplementer()) {
        self.channelsRepository = channelsRepository
    }
    
    func getNewEpisodes(completion: @escaping (Result<[MediaModel], Error>) -> Void) {
        return channelsRepository.getNewEpisodes { (cached) in
            completion(.success(cached))
        } completion: { (result) in
            switch result {
                case .success(let model):
                completion(.success(model.data?.toDomain() ?? []))
                    
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func getChannels(completion: @escaping (Result<[ChannelModel], Error>) -> Void) {
        return channelsRepository.getChannels { (cached) in
            completion(.success(cached))
        } completion: { (result) in
            switch result {
                case .success(let model):
                completion(.success(model.data?.toDomain() ?? []))
                    
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func getCetagories(completion: @escaping (Result<[CategoryModel], Error>) -> Void) {
        return channelsRepository.getCetagories { (cached) in
            completion(.success(cached))
        } completion: { (result) in
            switch result {
                case .success(let model):
                completion(.success(model.data?.toDomain() ?? []))
                    
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
}
