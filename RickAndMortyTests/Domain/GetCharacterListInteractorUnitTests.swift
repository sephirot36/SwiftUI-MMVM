//
//  GetCharacterListInteractorUnitTests.swift
//  RickAndMortyTests
//
//  Created by Daniel Castro muñoz on 3/5/24.
//

import XCTest
import Combine
@testable import RickAndMorty

final class GetCharacterListInteractorUnitTests: XCTestCase {
    
    // Class
    var characterListEntity = CharacterListEntity(
        info: CharacterListInfoEntity(count: 0, pages: 1, next: "", prev: ""),
        results: []
    )
    var characterEntity = CharacterEntity(id: nil, name: nil, status: nil, species: nil, gender: nil, image: nil, url: nil)
    var interactor: GetCharacterListInteractorDefault!
    
    // Mock
    var repository: RickAndMortyRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() async {
        // Given
        repository.shouldReturnCharacterListEntity(entity: characterListEntity)
        
        // When + Then
        _ = interactor.execute(page: 1)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: {
                    XCTAssertEqual($0.count, 3)
                }
            )
    }
}

extension GetCharacterListInteractorUnitTests {
    
    func buildMocks() {
        repository = RickAndMortyRepositoryMock()
        
        characterEntity = CharacterEntity(id: nil, name: nil, status: nil, species: nil, gender: nil, image: nil, url: nil)
        
        characterListEntity = CharacterListEntity(
            info: CharacterListInfoEntity(count: 0, pages: 1, next: "", prev: ""),
            results: [characterEntity,characterEntity,characterEntity]
        )
        
    }
    
    func buildClass() {
        interactor = GetCharacterListInteractorDefault(repository: repository)
    }
}

