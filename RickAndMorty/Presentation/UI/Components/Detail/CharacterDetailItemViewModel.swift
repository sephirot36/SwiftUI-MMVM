//
//  CharacterDetailItemViewModel.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Foundation

struct CharacterDetailItemViewModel {
    
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: CharacterSpecie
    let gender: CharacterGender
    let image: String
    let url: String
}

extension CharacterDetailItemViewModel {
    
    static func empty() -> Self {
        .init(
            id: 0,
            name: "",
            status: .unknown,
            species: .unknown,
            gender: .unknown,
            image: "",
            url: ""
        )
    }
    
    static func mock() -> Self {
        .init(
            id: 1,
            name: "Rick Sanchez",
            status: .Dead,
            species: .Alien,
            gender: .Female,
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            url: "https://rickandmortyapi.com/api/character/1"
        )
    }
}
