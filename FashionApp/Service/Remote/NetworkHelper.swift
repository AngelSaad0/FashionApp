//
//  NetworkHelper.swift
//  FashionApp
//
//  Created by Engy on 11/22/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingFailed
}


enum HTTPMethodType {
    case get
    case post
    case put
    case delete
}

enum NetworkErrorType: Error {
    case internalError
    case serverError
    case parsingError
    case badURL
}
struct EmptyResponse: Codable {}
