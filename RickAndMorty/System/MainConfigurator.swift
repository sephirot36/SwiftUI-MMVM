//
//  MainConfigurator.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct MainConfigurator {
    
    static var initialViewController: NavigationController {
        initialScreen()
    }
}

private extension MainConfigurator {
    
    static func initialScreen() -> NavigationController {
        let navController = NavigationController()
        let viewController = CharacterListConfigurator(navigationController: navController).viewController()
        navController.viewControllers = [viewController]
        
        return navController
    }
}

