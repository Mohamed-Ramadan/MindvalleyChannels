//
//  NewEpisodesResponseDTO+Mapping.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 04/07/2022.
//

import Foundation


// MARK: - DataClass
struct NewEpisodesResponseDTO: Codable {
    let media: [MediaDTO]
}

// MARK: - Media
struct MediaDTO: Codable {
    let type: String
    let title: String
    let coverAsset: AssetDTO?
    let channel: ChannelDTO?
}
