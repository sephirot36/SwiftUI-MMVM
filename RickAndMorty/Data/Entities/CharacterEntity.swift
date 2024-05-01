//
//  CharacterEntity.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterEntity: BaseEntity {
    
    let id: Int?
    let name: String?
    let status: CharacterStatusEntity?
    let species: CharacterSpecieEntity?
    let gender: CharacterGenderEntity?
    let image: String?
    let url: String?
}

enum CharacterStatusEntity: String, BaseEntity {
    case Alive
    case Dead
    case unknown
}

enum CharacterGenderEntity: String, BaseEntity {
    case Female
    case Male
    case Genderless
    case unknown
}

enum CharacterSpecieEntity: String, BaseEntity {
    case Alien
    case Human
    case unknown
}
