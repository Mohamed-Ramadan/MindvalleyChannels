//
//  DefaultChannelsCoreDataStorage.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 07/04/2022.
//

import CoreData
 
final class DefaultChannelsCoreDataStorage {

    private let coreDataStorage: CoreDataStorage

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }
   
    // MARK: - Private
    private func clearTable(_ tableName: String, in context: NSManagedObjectContext) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        let persistentStoreCoordinator = context.persistentStoreCoordinator!
        
        do {
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
}

extension DefaultChannelsCoreDataStorage: ChannelsResponseStorage {
    
    func getNewEpisodesResponse(completion: @escaping (Result<NewEpisodesResponseDTO?, CoreDataStorageError>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let fetchRequest = MediasResponseEntity.fetchRequest()
                let resultEntity = try context.fetch(fetchRequest).first

                completion(.success(resultEntity?.toDTO()))
            } catch {
                debugPrint(error.localizedDescription)
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }
    
    func saveNewEpisodes(responseDTO: NewEpisodesResponseDTO) {
        coreDataStorage.performBackgroundTask { context in
            do {
                self.clearTable("MediasResponseEntity", in: context)
                _ = responseDTO.toEntity(in: context)

                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    func getChannelsResponse(completion: @escaping (Result<ChannelsResponseDTO?, CoreDataStorageError>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let fetchRequest = ChannelsResponseEntity.fetchRequest()
                let resultEntity = try context.fetch(fetchRequest).first

                completion(.success(resultEntity?.toDTO()))
            } catch {
                debugPrint(error.localizedDescription)
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }
    
    func saveChannels(responseDTO: ChannelsResponseDTO) {
        coreDataStorage.performBackgroundTask { context in
            do {
                self.clearTable("ChannelsResponseEntity", in: context)
                _ = responseDTO.toEntity(in: context)

                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
    func getCategoriesResponse(completion: @escaping (Result<CategoriesResponseDTO?, CoreDataStorageError>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let fetchRequest = CategoriesResponseEntity.fetchRequest()
                let resultEntity = try context.fetch(fetchRequest).first

                completion(.success(resultEntity?.toDTO()))
            } catch {
                debugPrint(error.localizedDescription)
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }
    
    func saveCategories(responseDTO: CategoriesResponseDTO) {
        coreDataStorage.performBackgroundTask { context in
            do {
                self.clearTable("CategoriesResponseEntity", in: context)
                _ = responseDTO.toEntity(in: context)

                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
    
}

