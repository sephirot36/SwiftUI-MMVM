//
//  RickAndMortyRepository.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Combine

protocol RickAndMortyRepository {
    func getCharactersList(page: Int) -> AnyPublisher<CharacterListEntity, DataError>
    func getCharacterDetail(id: String) -> AnyPublisher<CharacterEntity, DataError>
}

final class RickAndMortyRepositoryDefault {

    private let remote: RickAndMortyDataSource
    
    init(remoteDataSource: RickAndMortyDataSource) {
        remote = remoteDataSource
    }
}

extension RickAndMortyRepositoryDefault: RickAndMortyRepository {
    
    func getCharactersList(page: Int) -> AnyPublisher<CharacterListEntity, DataError> {
        remote.getCharactersList(page: page)
    }
    
    func getCharacterDetail(id: String) -> AnyPublisher<CharacterEntity, DataError> {
        remote.getCharacterDetail(id: id)
    }
}
