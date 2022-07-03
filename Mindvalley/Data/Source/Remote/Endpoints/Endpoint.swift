//
//  Endpoint.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

/// Server endpoint interface, any server router should implement this interface to be able to connect
protocol Endpoint {
    
    /// The last path component to the endpoint. will be appended to the base url in the service
    var serviceUrl: String { get }
    
    /// The encoded parameters
    var parameters: [String: Any]? { get }
    
    /// The HTTP headers to be appended in the request, default is nil
    var headers: [String: Any]? { get }
    
    /// Http method as specified by the server
    var method: HTTPMethod { get }
    
    /// Determind if you want to print the response in the consol or not
    var isPrintable: Bool { get }
    
}

extension Endpoint {
    
    var domainUrl :String {
        return Constants.BASE_URL
    }
    
    /// Base url with serviceUrl
    var url: String {
        return domainUrl + serviceUrl
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var isPrintable: Bool {
        return true
    }
    
    var cacheIdentifier: String {
        return ""
    }
    
    func request<T: Codable>(completion: @escaping Response<T>) {
        NetworkService.request(url: url,
                           headers: headers,
                           httpMethod: method,
                           parameters: parameters,
                           isPrintable: isPrintable,
                           completion: completion)
    }
}
