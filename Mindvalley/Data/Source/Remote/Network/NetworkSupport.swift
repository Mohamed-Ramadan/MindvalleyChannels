//
//  NetworkSupport.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

enum NetworkResponse {
    case success(Data)
    case failure(Error)
}

typealias Response<T: Codable> = (Result<DataResponseDTO<T>, Error>) -> Void


class PrintHelper {
    
    static func logNetwork<T>(_ items: T, separator: String = " ", terminator: String = "\n") {
        print("""
            \n===================== 📟 ⏳ 📡 =========================
            \(items)
            ======================= 🚀 ⌛️ 📡 =========================
            """, separator: separator, terminator: terminator)
    }
}
