//
//  CharacterListRouter.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

protocol CharacterListRouter {
    func navigateToCharacterDetail(id: String)
}

final class CharacterListDefaultRouter {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension CharacterListDefaultRouter: CharacterListRouter {
    
    func navigateToCharacterDetail(id: String) {
        guard let navigationController else {
            return
        }
        let viewController = CharacterDetailConfigurator(navigationController: navigationController).viewController(characterID: id)
        navigationController.pushViewController(viewController, animated: true)
       
    }
}
