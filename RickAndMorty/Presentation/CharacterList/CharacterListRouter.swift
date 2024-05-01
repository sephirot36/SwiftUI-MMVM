//
//  CharacterListRouter.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

protocol CharacterListRouter {
    func navigateToPokemonDetail(id: String)
}

final class CharacterListDefaultRouter {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension CharacterListDefaultRouter: CharacterListRouter {
    
    func navigateToPokemonDetail(id: String) {
        guard let navigationController else {
            return
        }
      /*  let viewController = PokemonDetailConfigurator(navigationController: navigationController).viewController(pokemonNumber: id)
        navigationController.pushViewController(viewController, animated: true)
       */
    }
}
