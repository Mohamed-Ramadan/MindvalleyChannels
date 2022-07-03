//
//  Endpoint+Channels.swift
//  Mindvalley
//
//  Created by Mohamed Ramadan on 03/07/2022.
//

import Foundation

enum EndpointChannels: Endpoint {
    
    case getNewEpisodes
    case getChannels
    case getCetagories
    
    var method: HTTPMethod {
        return .get
    }
    
    // URL
    var serviceUrl: String {
        switch self {
        case .getNewEpisodes:
            return "raw/z5AExTtw"
        case .getChannels:
            return "raw/Xt12uVhM"
        case .getCetagories:
            return "raw/A0CgArX3"
        }
    }
    
    // headers
    var headers: [String: Any]? {
        return nil
    }
    
    // parameters
    var parameters: [String: Any]? {
        return nil
    }
}
