//
//  GetCharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Combine

// sourcery: AutoMockable
protocol GetCharacterListInteractor {
    func execute(page: Int) -> AnyPublisher<[CharacterModel], CharacterError>
}

final class GetCharacterListInteractorDefault {
    
    private let repository: RickAndMortyRepository
    
    init(repository: RickAndMortyRepository) {
        self.repository = repository
    }
}

extension GetCharacterListInteractorDefault: GetCharacterListInteractor {
    
    func execute(page: Int) -> AnyPublisher<[CharacterModel], CharacterError> {
        repository.getCharactersList(page: page)
            .map { $0.results.map { CharacterModelMapper.map($0) } }
            .mapError { CharacterMapperError.map($0) }
            .eraseToAnyPublisher()
    }
}

