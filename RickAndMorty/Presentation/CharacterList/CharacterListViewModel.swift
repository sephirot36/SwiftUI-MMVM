//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Combine

protocol CharacterListViewModel: ObservableObject {
    var screenState: CharacterListScreenState { get set }
    var chacractersList: CharacterListModel { get set }
    
    func loadCharacters()
    func loadCharacterDetail(id: String)
}

enum CharacterListScreenState {
    case loading
    case error
    case empty
    case content
}

final class CharacterListViewModelDefault {

    @Published var screenState: CharacterListScreenState = .loading
    @Published var chacractersList: CharacterListModel = .empty()
    
    private let getCharactersInteractor: GetCharacterListInteractor
    private let router: CharacterListRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        getCharactersInteractor: GetCharacterListInteractor,
        router: CharacterListRouter
    ) {
        self.getCharactersInteractor = getCharactersInteractor
        self.router = router
        
        loadCharacters()
    }
}

extension CharacterListViewModelDefault: CharacterListViewModel {
    
    func loadCharacters() {
        screenState = .loading
        getCharactersInteractor.execute(page: 1)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { charactersList in
                    self.chacractersList = CharacterListModelMapper.map(charactersList)
                    self.screenState = self.chacractersList.characters.isEmpty ? .empty : .content
                }
            )
            .store(in: &cancellables)
    }
    
    func loadCharacterDetail(id: String) {
        router.navigateToCharacterDetail(id: id)
    }
}
