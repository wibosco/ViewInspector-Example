//
//  ItemListRow.swift
//  SwiftUISearchExample
//
//  Created by James Rochabrun on 7/5/20.
//

import SwiftUI
import Combine

struct MovieRow: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            ImageViewCache(urls: (urlString: movie.posterPathHighResURLString, lowResURLString: movie.posterPathLowResURLString), errorImage: UIImage(systemName: "pause.rectangle.fill"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(contentMode: .fill)
                .frame(width: 67, height: 100)
            VStack(alignment: .leading, spacing: 10.0) {
                Text(movie.title)
                    .font(.system(size: 16, weight: .bold))
                    .lineLimit(2)
                Text(movie.overview)
                    .lineLimit(3)
                    .font(.system(size: 12, weight: .bold))
                Spacer()
                Text("Release date: \(movie.releaseDate)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color.gray)
                    .lineLimit(1)
            }
        }
    }
}
