//
//  RickAndMortyDataSource.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation
import Combine

protocol RickAndMortyDataSource {
    func getCharactersList(page: Int) -> AnyPublisher<CharacterListEntity, DataError>
    func getCharacterDetail(id: String) -> AnyPublisher<CharacterEntity, DataError>
}

final class RickAndMortyDataSourceDefault: RickAndMortyDataSource {
    
    func getCharactersList(page: Int) -> AnyPublisher<CharacterListEntity, DataError> {
        guard let request = API.Backend.RickAndMortyAPI.list(page: page).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
    
    func getCharacterDetail(id: String) -> AnyPublisher<CharacterEntity, DataError> {
        guard let request = API.Backend.RickAndMortyAPI.detail(id: id).urlRequest else {
            return Fail(error: DataError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return RemoteDataSource.run(request)
    }
}
