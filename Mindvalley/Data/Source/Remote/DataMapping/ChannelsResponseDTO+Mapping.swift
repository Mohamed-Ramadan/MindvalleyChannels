//
//  ChannelsResponseDTO+Mapping.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 04/07/2022.
//

import Foundation

// MARK: - DataClass
struct ChannelsResponseDTO: Codable {
    let channels: [ChannelDTO]
}

// MARK: - Channel
struct ChannelDTO: Codable {
    let title: String
    let id: String?
    let mediaCount: Int?
    let slug: String?
    let series: [SeriesDTO]?
    let latestMedia: [MediaDTO]?
    let iconAsset: AssetDTO?
    let coverAsset: AssetDTO?
}


// MARK: - IconAsset
struct AssetDTO: Codable {
    let thumbnailURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}


// MARK: - Series
struct SeriesDTO: Codable {
    let title: String
    let coverAsset: AssetDTO
    let id: String?
}
