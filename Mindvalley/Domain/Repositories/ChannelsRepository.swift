//
//  ChannelsRepository.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

protocol ChannelsRepository {
    func getNewEpisodes(completion: @escaping Response<NewEpisodesResponseDTO>)
    func getChannels(completion: @escaping Response<ChannelsResponseDTO>)
    func getCetagories(completion: @escaping Response<CategoriesResponseDTO>)
}
