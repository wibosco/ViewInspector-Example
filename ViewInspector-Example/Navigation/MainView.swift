//
//  MainView.swift
//  ViewInspector-Example
//
//  Created by William Boles on 12/11/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Movies", systemImage: "seal.fill")
                }
        }
    }
}
