//
//  NavigationController.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import UIKit

final class NavigationController: UINavigationController {
    override var isNavigationBarHidden: Bool {
        get { true }
        set { super.isNavigationBarHidden = newValue }
    }
}
