//
//  Image+Kingfisher.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import SwiftUI
import Kingfisher

extension Image {
    static func cachedURL(_ url: URL?) -> KFImage {
        KFImage.url(url, cacheKey: url?.cacheKey)
    }
}
