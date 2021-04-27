//
//  FavoritesView.swift
//  App08-TMDB-Favorites
//
//  Created by user189351 on 4/27/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var media = MediaModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(media: MediaModel())
    }
}
