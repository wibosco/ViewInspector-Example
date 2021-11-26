//
//  MoviesView.swift
//  ViewInspector-Example
//
//  Created by William Boles on 16/11/2021.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var model = MoviesProvider()
    
    var body: some View {
        NavigationView {
            List(model.movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailsView()) {
                    MovieRow(movie: movie)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Movies")
        }
    }
}
