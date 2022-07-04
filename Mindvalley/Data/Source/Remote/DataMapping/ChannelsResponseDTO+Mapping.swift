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

// MARK: - Mapping To Domain
extension ChannelsResponseDTO {
    func toDomain() -> [ChannelModel] {
        return channels.map{$0.toDomain()}
    }
}
extension ChannelDTO {
    func toDomain() -> ChannelModel {
        return .init(title: title,
                     id: id ?? "",
                     mediaCount: mediaCount ?? 0,
                     slug: slug ?? "",
                     series: series?.map{$0.toDomain()},
                     latestMedia: latestMedia?.map{$0.toDomain()} ?? [],
                     iconAsset: (iconAsset?.toDomain())!,
                     coverAsset: (coverAsset?.toDomain())!)
    }
}

extension AssetDTO {
    func toDomain() -> AssetModel {
        return .init(thumbnailURL: thumbnailURL, url: url)
    }
}

extension SeriesDTO {
    func toDomain() -> SeriesModel {
        return .init(id: id ?? "",
                     title: title,
                     coverAsset: coverAsset.toDomain())
    }
}
