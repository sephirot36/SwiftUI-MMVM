//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Combine

protocol CharacterDetailViewModel: ObservableObject {
    var screenState: CharacterDetailScreenState { get set }
    var characterDetail: CharacterDetailModel { get set }
    
    func loadCharacterDetail()
    func goBack()
}

enum CharacterDetailScreenState {
    case loading
    case error
    case empty
    case content
}

final class CharacterDetailViewModelDefault {

    @Published var screenState: CharacterDetailScreenState = .loading
    @Published var characterDetail: CharacterDetailModel = .empty()
    
    private let characterID: String
    private let getCharacterDetailInteractor: GetCharacterDetailInteractor
    private let router: CharacterDetailRouter
    
    private var cancellables = Set<AnyCancellable>()
    
    init(characterID: String,
        getCharacterDetailInteractor: GetCharacterDetailInteractor,
        router: CharacterDetailRouter
    ) {
        self.characterID = characterID
        self.getCharacterDetailInteractor = getCharacterDetailInteractor
        self.router = router
        
        loadCharacterDetail()
    }
}

extension CharacterDetailViewModelDefault: CharacterDetailViewModel {
    
    func loadCharacterDetail() {
        screenState = .loading
        getCharacterDetailInteractor.execute(id: characterID)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        self.screenState = .error
                    case .finished:
                        break
                    }
                },
                receiveValue: { character in
                    self.characterDetail = CharacterDetailModelMapper.map(character)
                    self.screenState = .content
                }
            )
            .store(in: &cancellables)
    }
    
    func goBack() {
        router.goBack()
    }
}
