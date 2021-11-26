//
//  MovieViewModel.swift
//  ViewInspector-Example
//
//  Created by William Boles on 16/11/2021.
//

import Foundation
import MovieRepository

struct MovieViewModel: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPathHighResURLString: String
    let posterPathLowResURLString: String
    
    // MARK: - Init
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.overview = movie.overview ?? "Not available overview"
        self.releaseDate = movie.releaseDate ?? "Not available date"
        self.posterPathHighResURLString = "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? "")
        self.posterPathLowResURLString = "https://image.tmdb.org/t/p/w200" + (movie.posterPath ?? "")
    }
}
