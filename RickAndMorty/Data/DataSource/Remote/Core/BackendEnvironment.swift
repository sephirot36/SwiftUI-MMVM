//
//  BackendEnvironment.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

enum BackendEnvironment: String {
    
    case pro
    case dev
    case pre
    
    var url: String {
        switch self {
        case .pro:
            return "https://rickandmortyapi.com/"
        case .dev:
            return "https://rickandmortyapi.com/"
        case .pre:
            return "https://rickandmortyapi.com/"
        }
    }
}
