//
//  CategoriesResponseDTO+Mapping.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 04/07/2022.
//

import Foundation

// MARK: - CategoriesResponseDTO
struct CategoriesResponseDTO: Codable {
    let categories: [CategoryDTO]
}

// MARK: - CategoryDTO
struct CategoryDTO: Codable {
    let name: String
}

//MARK: - Mapping To Domain
extension CategoriesResponseDTO {
    func toDomain() -> [CategoryModel] {
        return categories.map{$0.toDomain()}
    }
}

extension CategoryDTO {
    func toDomain() -> CategoryModel {
        return .init(name: name)
    }
}
