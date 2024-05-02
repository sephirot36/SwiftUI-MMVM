//
//  CharacterDetailConfigurator.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import SwiftUI

struct CharacterDetailConfigurator {
    
    private let navigationController: NavigationController
   
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController(characterID: String) -> UIViewController {
        // Router
        let router = CharacterDetailDefaultRouter(navigationController: navigationController)
        
        // Repository
        let dataSource = RickAndMortyDataSourceDefault()
        let repository = RickAndMortyRepositoryDefault(remoteDataSource: dataSource)
        
        // Interactor
        let getCharacterDetailInteractor = GetCharacterDetailInteractorDefault(repository: repository)
        
        // viewModel
        let viewModel = CharacterDetailViewModelDefault(
            characterID: characterID,
            getCharacterDetailInteractor: getCharacterDetailInteractor,
            router: router
        )
        
        // View
        let view: some View = CharacterDetailView<CharacterDetailViewModelDefault>().environmentObject(viewModel)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}

