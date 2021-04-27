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
                            width: 120,
                            height: 180)
                        .cornerRadius(20)
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("SourLemon"),
                                    style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        )
                    VStack {
                        Text(fav.title_wrapepd)
                            .font(.Akaya(size: 24))
                            .multilineTextAlignment(.center)
                        Text("(\(String(fav.release_date_wrapepd)))")
                            .font(.Akaya(size: 24))
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(Color("SourLemon"))
                }
                .padding(.vertical, 10)
                
            }
        }
    }
}

struct FavoriteCellView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCellView(fav: Favorites())
    }
}
