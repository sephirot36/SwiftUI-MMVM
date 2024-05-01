//
//  BaseEntityWithHeaders.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

struct BaseEntityWithHeaders<D: Codable, H: Codable>: BaseEntity {
    var data: D?
    var headers: H?
}
