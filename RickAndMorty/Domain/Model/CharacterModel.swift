//
//  Character.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct CharacterModel: BaseModel {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: CharacterSpecie
    let gender: CharacterGender
    let image: String
    let url: String
}

extension CharacterModel: Equatable {
    
    static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        lhs.id == rhs.id
    }
}

enum CharacterStatus: String, CaseIterable {
    case Alive = "Alive"
    case Dead = "Dead"
    case unknown = "unknown"
    
    static func getCase(string:String) -> CharacterStatus {
           return self.allCases.first{"\($0.rawValue)" == string} ?? .unknown
    }
}

enum CharacterSpecie: String, CaseIterable {
    case Alien = "Alien"
    case Human = "Human"
    case unknown = "unknown"
    
    static func getCase(string:String) -> CharacterSpecie {
           return self.allCases.first{"\($0.rawValue)" == string} ?? .unknown
    }
}

enum CharacterGender: String, CaseIterable {
    case Female = "Female"
    case Male = "Male"
    case Genderless = "Genderless"
    case unknown = "unknown"
    
    static func getCase(string:String) -> CharacterGender {
           return self.allCases.first{"\($0.rawValue)" == string} ?? .unknown
    }
}
