//
//  CharacterMapper.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterModelMapper {
    static func map(_ entity: CharacterEntity) -> CharacterModel {
        CharacterModel(id: entity.id ?? 0,
                       name: entity.name ?? "",
                       status: mapStatus(entity.status ?? .unknown),
                       species: mapSpecies(entity.species ?? .unknown),
                       gender:  mapGender(entity.gender ?? .unknown),
                       image: entity.image ?? "",
                       url: entity.url ?? "")
    }
}

extension CharacterModelMapper {
    static func mapStatus(_ entity: CharacterStatusEntity) -> CharacterStatus {
        CharacterStatus.getCase(string: entity.rawValue)
    }
    
    static func mapSpecies(_ entity: CharacterSpecieEntity) -> CharacterSpecie {
        CharacterSpecie.getCase(string: entity.rawValue)
    }
    
    static func mapGender(_ entity: CharacterGenderEntity) -> CharacterGender {
        CharacterGender.getCase(string: entity.rawValue)
    }
}
