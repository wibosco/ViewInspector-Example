//
//  Movie.swift
//  MovieRepository
//
//  Created by William Boles on 23/11/2021.
//

import Foundation

public struct Movie {
    public let id: Int
    public let title: String
    public var overview: String?
    public var posterPath: String?
    public var backdropPath: String?
    public var releaseDate: String?
}

struct MovieFeedResult: Decodable {
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    let movies: [Movie]
}

extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case id
        case title
        case overview
    }
}
