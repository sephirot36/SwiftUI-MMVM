//
//  Mocks.swift
//  RickAndMortyTests
//
//  Created by Daniel Castro muñoz on 3/5/24.
//

import Foundation
import Combine

@testable import RickAndMorty

// Repository
final class RickAndMortyRepositoryMock {
    private var characterListEntity: CharacterListEntity = .init(
        info: CharacterListInfoEntity(count: 0, pages: 1, next: "", prev: ""),
        results: []
    )
    
    private var characterEntity: CharacterEntity = CharacterEntity(id: nil, name: nil,
                                                                       status: nil, species: nil,
                                                                       gender: nil, image: nil,
                                                                       url: nil)
}

extension RickAndMortyRepositoryMock: RickAndMortyRepository {
    
    func shouldReturnCharacterListEntity(entity: CharacterListEntity) {
        characterListEntity = entity
    }
    
    func shouldReturnCharacterEntity(entity: CharacterEntity) {
        characterEntity = entity
    }
    
    func getCharactersList(page: Int) -> AnyPublisher<CharacterListEntity, DataError> {
        // Simulamos la emisión de datos
        return Just(characterListEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
    
    func getCharacterDetail(id: String) -> AnyPublisher<CharacterEntity, DataError> {
        // Simulamos la emisión de datos
                return Just(characterEntity)
                    .setFailureType(to: DataError.self)
                    .eraseToAnyPublisher()
    }
}

// Mock router
class CharacterDetailRouterMock {
    
    var navigateBackCalled: Bool
    
    init() {
        self.navigateBackCalled = false
    }
}

extension CharacterDetailRouterMock: CharacterDetailRouter {
    
    func goBack() {
        navigateBackCalled = true
    }
}

// Mock interactor
final class GetCharacterDetailInteractorMock {}

extension GetCharacterDetailInteractorMock: GetCharacterDetailInteractor {
    
    func execute(id: String) -> AnyPublisher<CharacterModel, CharacterError> {
        // Simulamos la emisión de datos
        let mock = CharacterModel(id: 1, name: "Rick", status: .Alive, species: .Human, gender: .Male, image: "imageStr", url: "UrlStr")
                return Just(mock)
                    .setFailureType(to: CharacterError.self)
                    .eraseToAnyPublisher()
    }
}

