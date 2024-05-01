//
//  CharacterListEntity.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterListEntity: BaseEntity {
    let info: CharacterListInfoEntity
    let results: [CharacterEntity]
}

struct CharacterListInfoEntity: BaseEntity {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
