//
//  ChannelsRepository.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

protocol ChannelsRepository {
    func getNewEpisodes(cached: @escaping ([MediaModel])->Void,
                        completion: @escaping Response<NewEpisodesResponseDTO>)
    func getChannels(cached: @escaping ([ChannelModel])->Void,
                     completion: @escaping Response<ChannelsResponseDTO>)
    func getCetagories(cached: @escaping ([CategoryModel])->Void,
                       completion: @escaping Response<CategoriesResponseDTO>)
}
