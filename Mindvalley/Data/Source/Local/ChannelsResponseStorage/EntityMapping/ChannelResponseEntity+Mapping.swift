//
//  ChannelResponseEntity+Mapping.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/04/2022.
//

import CoreData

//MARK: - Mapping To Data Transfer Object
extension ChannelsResponseEntity {
    func toDTO() -> ChannelsResponseDTO {
        return .init(channels: self.channels?.map{($0 as! ChannelResponseEntity).toDTO()} ?? [])
    }
}


extension ChannelResponseEntity {
    func toDTO() -> ChannelDTO {
        let seriesList = series?.map{($0 as! SeriesResponseEntity).toDTO()} ?? []
        let mediaList = latestMedia?.map{($0 as! MediaResponseEntity).toDTO()} ?? []
        return .init(title: title ?? "",
                     id: id ?? "",
                     mediaCount: Int(mediaCount),
                     slug: slug ?? "",
                     series: seriesList,
                     latestMedia: mediaList,
                     iconAsset: iconAsset?.toDTO(),
                     coverAsset: coverAsset?.toDTO())
    }
}

extension SeriesResponseEntity {
    func toDTO() -> SeriesDTO {
        return .init(title: title ?? "",
                     coverAsset: (coverAsset?.toDTO())!,
                     id: id ?? "")
    }
}

extension AssetsResponseEntity {
    func toDTO() -> AssetDTO {
        return .init(thumbnailURL: thumbnailURL, url: url)
    }
}

extension MediasResponseEntity {
    func toDTO() -> NewEpisodesResponseDTO {
        return .init(media: media?.map{($0 as! MediaResponseEntity).toDTO()} ?? [])
    }
}

extension MediaResponseEntity {
    func toDTO() -> MediaDTO {
        return .init(type: type ?? "",
                     title: title ?? "",
                     coverAsset: coverAsset?.toDTO(),
                     channel: channel?.toDTO())
    }
}

extension CategoriesResponseEntity {
    func toDTO() -> CategoriesResponseDTO {
        return .init(categories: categories?.map({($0 as! CategoryResponseEntity).toDTO()}) ?? [])
    }
}
extension CategoryResponseEntity {
    func toDTO() -> CategoryDTO {
        return .init(name: name ?? "")
    }
}


// Mapping to Entity Model
extension ChannelsResponseDTO {
    func toEntity(in context: NSManagedObjectContext) -> ChannelsResponseEntity {
        let entity: ChannelsResponseEntity = .init(context: context)
        
        self.channels.forEach {
            entity.addToChannels($0.toEntity(in: context))
        }
        
        return entity
    }
}

extension ChannelDTO {
    func toEntity(in context: NSManagedObjectContext) -> ChannelResponseEntity {
        let entity: ChannelResponseEntity = .init(context: context)
        
        entity.id = id
        entity.title = title
        entity.mediaCount = Int16(mediaCount ?? 0)
        entity.slug = slug
        entity.iconAsset = iconAsset?.toEntity(in: context)
        entity.coverAsset = coverAsset?.toEntity(in: context)
        
        series?.forEach {
            entity.addToSeries($0.toEntity(in: context))
        }
        
        latestMedia?.forEach {
            entity.addToLatestMedia($0.toEntity(in: context))
        }
        return entity
    }
}

extension SeriesDTO {
    func toEntity(in context: NSManagedObjectContext) -> SeriesResponseEntity {
        let entity: SeriesResponseEntity = .init(context: context)
        
        entity.id = id
        entity.title = title
        entity.coverAsset = coverAsset.toEntity(in: context)

        return entity
    }
}

extension AssetDTO {
    func toEntity(in context: NSManagedObjectContext) -> AssetsResponseEntity {
        let entity: AssetsResponseEntity = .init(context: context)
        
        entity.thumbnailURL = thumbnailURL
        entity.url = url

        return entity
    }
}

extension NewEpisodesResponseDTO {
    func toEntity(in context: NSManagedObjectContext) -> MediasResponseEntity {
        let entity: MediasResponseEntity = .init(context: context)
        
        self.media.forEach {
            entity.addToMedia($0.toEntity(in: context))
        }
        
        return entity
    }
}


extension MediaDTO {
    func toEntity(in context: NSManagedObjectContext) -> MediaResponseEntity {
        let entity: MediaResponseEntity = .init(context: context)
        
        entity.type = type
        entity.title = title
        entity.coverAsset = coverAsset?.toEntity(in: context)
        entity.channel = channel?.toEntity(in: context)
        
        return entity
    }
}

extension CategoriesResponseDTO {
    func toEntity(in context: NSManagedObjectContext) -> CategoriesResponseEntity {
        let entity: CategoriesResponseEntity = .init(context: context)
        
        self.categories.forEach {
            entity.addToCategories($0.toEntity(in: context))
        }
        
        return entity
    }
}

extension CategoryDTO {
    func toEntity(in context: NSManagedObjectContext) -> CategoryResponseEntity {
        let entity: CategoryResponseEntity = .init(context: context)
        
        entity.name = name
        
        return entity
    }
}
