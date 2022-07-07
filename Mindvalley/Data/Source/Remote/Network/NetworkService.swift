//
//  NetworkService.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

class NetworkService {
    static func request<T: Codable>(url: String,
                 headers: [String:Any]? = nil,
                 httpMethod: HTTPMethod,
                 parameters: [String: Any]? = nil,
                 isPrintable: Bool,
                 multiPart: Bool? = false,
                 imageParameters:[String: Any] = [:],
                 completion: @escaping Response<T>) {
        
        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: encodedURL)else {
            print("❌ Network Service: Not Valid URL: \(url.description)")
            return
        }
        
        PrintHelper.logNetwork(
            """
            🙇‍♂️ \(httpMethod.rawValue.uppercased()) '\(url)':
            📝 Request headers = \(headers ?? [:])
            📝 Request Body = \(parameters ?? [:])
            """
        )
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
  
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "Data not valid or empty", code: 402, userInfo: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                
                return
            }
            
            NetworkService.jsonParsing(url.absoluteString, data: data, completion: completion)
        }
        
        task.resume()
    }
    
    static func jsonParsing<T: Decodable>(_ url: String,
                                          data: Data,
                                          completion: @escaping Response<T>) {
        
        do {
            let decoder = JSONDecoder()
            let model = try decoder.decode(DataResponseDTO<T>.self, from: data)
            PrintHelper.logNetwork(model)
            
            DispatchQueue.main.async {
                completion(.success(model))
            }
            
        } catch let error {
            // return decoding failed
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            
            PrintHelper.logNetwork("❌ Error in Mapping\n\(url)\nError:\n\(error)")
        }
    }
}
