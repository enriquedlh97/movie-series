//
//  FavoritesView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var media = MediaModel()
    @FetchRequest(
        entity: Favorites.entity(),
        sortDescriptors: [NSSortDescriptor(key: "release_date", ascending: false)])
    var favorites: FetchedResults<Favorites>
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(favorites) { fav in
                    Text(fav.title_wrapepd)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(media: MediaModel())
    }
}
