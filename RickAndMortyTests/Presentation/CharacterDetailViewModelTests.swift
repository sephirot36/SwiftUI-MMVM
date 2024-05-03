//
//  CharacterDetailViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Daniel Castro muñoz on 3/5/24.
//

import XCTest
import Combine
@testable import RickAndMorty

final class CharacterDetailViewModelTests: XCTestCase {

    var sut: CharacterDetailViewModelDefault!
    // Router
    let mockRouter = CharacterDetailRouterMock()
    
    // Interactor
    let getCharacterDetailInteractorMock = GetCharacterDetailInteractorMock()
    
    override func setUp() {
        super.setUp()
        sut = CharacterDetailViewModelDefault(characterID: "1",
                                              getCharacterDetailInteractor: getCharacterDetailInteractorMock,
                                              router: mockRouter)
    }
    
    func testLoadPokemons() {
        // When create sut
        // Then
        XCTAssertEqual(sut.characterDetail.character.id, 1)
        XCTAssertEqual(sut.characterDetail.character.name, "Rick")
        XCTAssertEqual(sut.characterDetail.character.status, .Alive)
        XCTAssertEqual(sut.characterDetail.character.gender, .Male)
        XCTAssertEqual(sut.characterDetail.character.species, .Human)
        
        XCTAssertEqual(sut.screenState, .content)
        
    }
    
    func testGoBack() {
        // When
        sut.goBack()
        
        // Then
        XCTAssertTrue( mockRouter.navigateBackCalled)
    }

}
