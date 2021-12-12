//
//  Model.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import Foundation


struct Model: Decodable {
    let feed: Feed//
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let name: String
    let artworkUrl100: String
    let genres: [Genre]
}

struct Genre: Decodable {
    let name: String
}

