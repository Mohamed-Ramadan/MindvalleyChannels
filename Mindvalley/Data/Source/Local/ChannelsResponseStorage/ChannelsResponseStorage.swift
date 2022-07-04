//
//  ChannelsResponseStorage.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/04/2022.
//

import Foundation


protocol ChannelsResponseStorage {
   func getNewEpisodesResponse(completion: @escaping (Result<NewEpisodesResponseDTO?, CoreDataStorageError>) -> Void)
   func saveNewEpisodes(responseDTO: NewEpisodesResponseDTO)
    
    func getChannelsResponse(completion: @escaping (Result<ChannelsResponseDTO?, CoreDataStorageError>) -> Void)
    func saveChannels(responseDTO: ChannelsResponseDTO)
    
    func getCategoriesResponse(completion: @escaping (Result<CategoriesResponseDTO?, CoreDataStorageError>) -> Void)
    func saveCategories(responseDTO: CategoriesResponseDTO)
}
