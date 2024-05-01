//
//  URLRequest+Headers.swift
//  RickAndMorty
//
//  Created by Daniel Castro muñoz on 1/5/24.
//

import Foundation

extension URLRequest {
    
    mutating func addContentHeaders() {
        setValue(HttpConstants.HeaderValue.applicationJson, forHTTPHeaderField: HttpConstants.Header.contentType)
    }
}

extension URLRequest {
    
    mutating func addEncodedBody(withParams params: Encodable) {
        httpBody = try? JSONEncoder().encode(params)
    }
}
