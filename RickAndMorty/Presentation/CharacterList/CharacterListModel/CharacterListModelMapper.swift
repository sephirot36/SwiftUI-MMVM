//
//  CharacterListModelMapper.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterListModelMapper {
    
    static func map(_ characterList: [CharacterModel]) -> CharacterListModel {
        .init(
            characters: characterList.map {
                .init(
                    id: $0.id,
                    name: $0.name,
                    status: $0.status,
                    species: $0.species,
                    gender: $0.gender,
                    image: $0.image,
                    url: $0.url
                )
            }
        )
    }
}
