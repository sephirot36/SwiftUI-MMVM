//
//  CharacterListModel.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterListModel {
    
    let characters: [CharacterListItemViewModel]
    
    static func empty() -> Self {
        .init(characters: [])
    }
}
