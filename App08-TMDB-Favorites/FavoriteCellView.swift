//
//  FavoriteCellView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI
import Kingfisher

struct FavoriteCellView: View {
    
    var fav: Favorites
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    KFImage(URL(string: fav.poster_path_wrapepd)!)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: 200,
                            height: 300)
                        .cornerRadius(40)
                    VStack {
                        Text(fav.title_wrapepd)
                            .font(.Akaya(size: 24))
                            .multilineTextAlignment(.center)
                        Text("(\(String(fav.release_date_wrapepd))")
                            .font(.Akaya(size: 24))
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
        }
    }
}

struct FavoriteCellView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCellView(fav: Favorites())
    }
}
