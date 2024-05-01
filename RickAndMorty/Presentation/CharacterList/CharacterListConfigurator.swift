//
//  CharacterListConfigurator.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import SwiftUI

struct CharacterListConfigurator {
    
    private let navigationController: NavigationController
   
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func viewController() -> UIViewController {
        // Router
        let router = CharacterListDefaultRouter(navigationController: navigationController)
        
        // Repository
        let dataSource = RickAndMortyDataSourceDefault()
        let repository = RickAndMortyRepositoryDefault(remoteDataSource: dataSource)
        
        // Interactor
        let getCharactersListInteractor = GetCharacterListInteractorDefault(repository: repository)
        
        // Presenter
        let viewModel = CharacterListViewModelDefault(
            getCharactersInteractor: getCharactersListInteractor,
            router: router
        )
        
        // View
        let view: some View = CharacterListView<CharacterListViewModelDefault>().environmentObject(viewModel)
        let hostingController: UIViewController = HostingController(rootView: view)
        
        return hostingController
    }
}
