//
//  RickAndMortyAPI.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

extension API.Backend {
    
    enum RickAndMortyAPI: URLRequestConvertible {
        
        case list(page: Int)
        case detail(id: String)
        
        var method: HttpConstants.Method {
            switch self {
            case .list, .detail:
                return .get
            }
        }
        
        var endpoint: URL? {
            switch self {
            case .list(let page):
                return URL(string: HttpConstants.apiBaseURL + "character?page=\(page)")
            case .detail(let id):
                return URL(string: HttpConstants.apiBaseURL + "character/\(id)/")
            }
        }
        
        func addHeaders(toRequest request: inout URLRequest) {}
        
        func addBody(toRequest request: inout URLRequest) {}
    }
}
