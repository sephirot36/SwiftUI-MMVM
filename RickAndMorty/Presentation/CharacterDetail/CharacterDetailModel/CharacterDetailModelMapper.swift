//
//  CharacterDetailModelMapper.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Foundation

struct CharacterDetailModelMapper {
    
    static func map(_ character: CharacterModel) -> CharacterDetailModel {
        .init(
            character: .init(
                    id: character.id,
                    name: character.name,
                    status: character.status,
                    species: character.species,
                    gender: character.gender,
                    image: character.image,
                    url: character.url
        ))
    }
}

