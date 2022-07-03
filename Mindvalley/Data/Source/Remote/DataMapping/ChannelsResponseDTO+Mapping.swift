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
    let series: [SeriesDTO]?
    let mediaCount: Int?
    let latestMedia: [MediaDTO]?
    let id: String?
    let iconAsset: IconAssetDTO?
    let coverAsset: CoverAssetDTO?
    let slug: String?
}


// MARK: - IconAsset
struct IconAssetDTO: Codable {
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
    let coverAsset: CoverAssetDTO
    let id: String?
}
