//
//  CharacterDetailModel.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Foundation

struct CharacterDetailModel {
    
    let character: CharacterDetailItemViewModel
    
    static func empty() -> Self {
        .init(character: .empty())
    }
}
