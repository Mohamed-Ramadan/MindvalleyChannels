//
//  MedialItemViewModel.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import Foundation

struct MedialItemViewModel: ChannelsItemViewModel, Hashable {
    let type: String
    let title: String
    let coverAsset: String
    let channelTitle: String
    let identifier: String
    
    
    init(type: String, title: String, coverAsset: String, channelTitle: String, identifier:String = UUID().uuidString) {
        self.title = title
        self.type = type
        self.coverAsset = coverAsset
        self.channelTitle = channelTitle
        self.identifier = identifier
    }
    
    func hash(int hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: MedialItemViewModel, rhs: MedialItemViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
