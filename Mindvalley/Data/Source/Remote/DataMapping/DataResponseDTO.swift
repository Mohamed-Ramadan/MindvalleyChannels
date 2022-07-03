//
//  DataResponseDTO.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

// MARK: - GeneralResponseModel
struct DataResponseDTO<T: Codable>: Codable {
    let data: T?
}

struct EmptyModel: Codable {
}
