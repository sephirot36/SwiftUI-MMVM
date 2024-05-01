//
//  CharacterMapperError.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterMapperError {
    
    static func map(_ error: DataError) -> CharacterError {
        switch error {
        default:
            return .undefined
        }
    }
}
