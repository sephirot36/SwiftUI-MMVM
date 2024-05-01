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
    let status: String?
    let species: CharacterSpecie?
    let gender: CharacterGender?
    let image: String?
    let url: String?
}

enum CharacterStatus: String, BaseEntity {
    case Alive
    case Dead
    case unknown
}

enum CharacterGender: String, BaseEntity {
    case Female
    case Male
    case Genderless
    case unknown
}

enum CharacterSpecie: String, BaseEntity {
    case Alien
    case Human
}
