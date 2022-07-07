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
    let channel: MediaChannelDTO?
}

struct MediaChannelDTO: Codable {
    let title: String
}

// MARK: - Mapping To Domain
extension NewEpisodesResponseDTO {
    func toDomain() -> [MediaModel] {
        return media.map{$0.toDomain()}
    }
}

extension MediaDTO {
    func toDomain() -> MediaModel {
        return .init(type: type,
                     title: title,
                     coverAsset: coverAsset?.url ?? "",
                     channelTitle: channel?.title ?? "")
    }
}

extension MediaChannelDTO {
    func toDomain() -> String {
        return title
    }
}
