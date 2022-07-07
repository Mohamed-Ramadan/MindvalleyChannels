//
//  MediaModel.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

struct MediaModel: Hashable {
    let type: String
    var title: String
    let coverAsset: String
    let channelTitle: String
    
    let identifier = UUID().uuidString
    
    
    init(type: String, title: String, coverAsset: String, channelTitle: String) {
        self.title = title
        self.type = type
        self.coverAsset = coverAsset
        self.channelTitle = channelTitle
    }
    
    func hash(int hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: MediaModel, rhs: MediaModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
