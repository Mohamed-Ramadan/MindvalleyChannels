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
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAssetDTO
    let channel: ChannelDTO?
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}


// MARK: - CoverAsset
struct CoverAssetDTO: Codable {
    let url: String
}
