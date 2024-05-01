//
//  GetCharacterDetailInteractor.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Combine

// sourcery: AutoMockable
protocol GetCharacterDetailInteractor {
    func execute(id: String) -> AnyPublisher<CharacterModel, CharacterError>
}

final class GetCharacterDetailInteractorDefault {
    
    private let repository: RickAndMortyRepository
    
    init(repository: RickAndMortyRepository) {
        self.repository = repository
    }
}

extension GetCharacterDetailInteractorDefault: GetCharacterDetailInteractor {
    
    func execute(id: String) -> AnyPublisher<CharacterModel, CharacterError> {
        repository.getCharacterDetail(id: id)
            .map { CharacterModelMapper.map($0) }
            .mapError { CharacterMapperError.map($0) }
            .eraseToAnyPublisher()
    }
}
