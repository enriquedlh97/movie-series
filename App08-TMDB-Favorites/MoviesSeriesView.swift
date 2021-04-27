//
//  ContentView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct MoviesSeriesView: View {
    
    @StateObject var media = MediaModel()
    
    var body: some View {
        NavigationView {
            TabView {
                MoviesView(media: media)
                    .tabItem {
                        Label("Movies", systemImage: "film.fill")
                    }
                SeriesView(media: media)
                    .tabItem {
                        Label("Series", systemImage: "play.tv.fill")
                    }
            }
        }
        .accentColor(Color("Alizarin"))
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("SourLemon"))
        }
    }
}

struct MoviesSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSeriesView()
    }
}
