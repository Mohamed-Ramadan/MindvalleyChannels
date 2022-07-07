//
//  ChannelsViewModel.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/07/2022.
//

import Foundation


enum ChannelsViewModelLoading {
    case fullScreen
    case nextPage
    case none
}

protocol ChannelsViewModelInput {
    func viewDidLoad()
}


class ChannelsViewModel: ChannelsViewModelInput {
    
    private(set) var channelsUseCase: ChannelsUseCase
    var channels: [ChannelModel] = [] {
        didSet{
            self.refreshModels()
        }
    }
    
    var newEpisodes: [MediaModel] = [] {
        didSet{
            self.refreshModels()
        }
    }
    
    var categories: [CategoryModel] = [] {
        didSet{
            self.refreshModels()
        }
    }
    
    var medias: [ChannelSection] = [] {
        didSet {
            self.reloadCompletionHandler()
        }
    }
    
    struct ChannelSection {
        let title: String
        let type: SectionType
        let headerIcon: String?
        let mediaCount: Int?
        let media: [MediaModel]
    }
    
    enum SectionType: String, CaseIterable {
        case NEWEPISODES = "New Episodes"
        case CATAGORIES = "Browse by categories"
        case SERIES
        case COURSE
    }
    
    private(set) var totalPhotos = 1
    private(set) var pageSize = 10
    private(set) var currentPage = 0
    var nextPage: Int { currentPage + 1 }
    
    private(set) var loading: ChannelsViewModelLoading = .none {
        didSet {
            self.loadingCompletionHandler(loading)
        }
    }
     
    var error:(_ errMsg: String)->() = {_ in}
    var reloadCompletionHandler: ()->() = {}
    var channelsCompletionHandler: ()->() = {}
    var newEpisodesCompletionHandler: ()->() = {}
    var categoriesCompletionHandler: ()->() = {}
    var loadingCompletionHandler:(_ loading: ChannelsViewModelLoading) -> () = {_ in}
    
    //MARK: - init
    init(channelsUseCase: ChannelsUseCase = DefaultChannelsUseCase()) {
        self.channelsUseCase = channelsUseCase
    }
    
    //MARK:- Private
    
    private func load(loading: ChannelsViewModelLoading) {
        self.getNewEpisodes(loading: loading)
        self.getChannels(loading: loading)
        self.getCategories(loading: loading)
    }
    
    func getNewEpisodes(loading: ChannelsViewModelLoading) {
        self.loading = loading
        
        channelsUseCase.getNewEpisodes { (result) in
            self.loading = .none
            
            switch result {
            case .success(let model):
                self.newEpisodes = model
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
    
    func getChannels(loading: ChannelsViewModelLoading) {
        self.loading = loading
        
        channelsUseCase.getChannels { (result) in
            self.loading = .none
            
            switch result {
            case .success(let model):
                self.channels = model
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
    
    func getCategories(loading: ChannelsViewModelLoading) {
        self.loading = loading
        
        channelsUseCase.getCetagories { (result) in
            self.loading = .none
            
            switch result {
            case .success(let model):
                self.categories = model
            case .failure(let error):
                self.error(error.localizedDescription)
            }
        }
    }
    
    func update() {
        load(loading: .fullScreen)
    }
    
    func refreshModels() {
        var sections: [ChannelSection] = []
        
        let newEpisodesSection = ChannelSection(title: SectionType.NEWEPISODES.rawValue, type: .NEWEPISODES, headerIcon: nil, mediaCount: nil, media: Array(self.newEpisodes.prefix(6)))
        sections.append(newEpisodesSection)
        
        self.channels.forEach { channel in 
            sections.append(ChannelSection(title: channel.title, type: (channel.series?.count == 0) ? .COURSE : .SERIES, headerIcon: channel.coverAsset.url, mediaCount: channel.mediaCount, media: Array(channel.latestMedia.prefix(6))))
        }
        
        self.medias = sections
    }
}


// MARK: - INPUT. View event methods
extension ChannelsViewModel {
    func viewDidLoad() {
        self.update()
    }
}
