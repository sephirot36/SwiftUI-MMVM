//
//  CharacterDetailRouter.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Foundation

protocol CharacterDetailRouter {
    func goBack()
}

final class CharacterDetailDefaultRouter {
    
    private weak var navigationController: NavigationController?
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
}

extension CharacterDetailDefaultRouter: CharacterDetailRouter {
    
    func goBack() {
        guard let navigationController else {
            return
        }
        navigationController.popViewController(animated: true)
    }
}

