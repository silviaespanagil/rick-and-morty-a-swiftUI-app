//
//  HTTPError.swift
//  RickMorty
//
//  Created by Xavi on 10/11/21.
// 

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
