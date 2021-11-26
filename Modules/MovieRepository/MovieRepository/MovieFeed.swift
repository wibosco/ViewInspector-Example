//
//  MovieFeed.swift
//  MovieRepository
//
//  Created by William Boles on 23/11/2021.
//

import Foundation

public enum MovieFeed {
    case nowPlaying
    case topRated
}

extension MovieFeed {
    func path() -> String {
        switch self {
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .topRated:
            return "/3/movie/top_rated"
        }
    }
}
