//
//  StringProtocol+Ext.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 2/5/24.
//

import Foundation

extension StringProtocol {
    
    var firstUppercased: String {
        prefix(1).uppercased() + dropFirst()
    }
}

