//
//  MoviesProvider.swift
//  ViewInspector-Example
//
//  Created by William Boles on 11/11/2021.
//

import Foundation
//import Combine
import MovieRepository

class MoviesProvider: ObservableObject {
    private let dataProvider = MovieDataProvider()
    
    @Published var movies: [MovieViewModel] = []
    
    // MARK: - Init
    
    init() {
        dataProvider.retrieveFeed(.nowPlaying) { result in
            do {
                let movies = try result.get()
                self.movies = movies.map { MovieViewModel(movie: $0) }
            } catch {
                //TODO: handle errors
            }
        }
    }
}
