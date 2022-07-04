//
//  ChannelModel.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 04/07/2022.
//

import Foundation

struct ChannelModel {
    let title: String
    let id: String
    let mediaCount: Int
    let slug: String
    let series: [SeriesModel]?
    let latestMedia: [MediaModel]
    let iconAsset: AssetModel
    let coverAsset: AssetModel
}

struct AssetModel {
    let thumbnailURL: String?
    let url: String?
}


struct SeriesModel {
    let id: String
    let title: String
    let coverAsset: AssetModel
}
