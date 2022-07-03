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
