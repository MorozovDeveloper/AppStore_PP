//
//  Model.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import Foundation

struct Model: Decodable {
    let feed: Feed
}


struct Feed: Decodable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}


struct Author: Decodable {
    let name: String
    let url: String
}


struct Link: Decodable {
    let linkSelf: String

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
    }
}


struct Result: Decodable {
    let artistName, id, name, releaseDate: String
    let kind: Kind
    let artworkUrl100: String // image
    let genres: [Genre]
    let url: String
}


struct Genre: Decodable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Decodable {
    case apps = "apps"
}
