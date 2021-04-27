//
//  FavoritesDetailView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI
import Kingfisher

struct FavoritesDetailView: View {
    
    var videos: MediaModel
    var fav: Favorites
    @State var posters = [Poster]()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text(fav.overview_wrapepd)
                            .font(.Akaya(size: 24))
                            .foregroundColor(Color("BelizeHole"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,20)
                            .padding(.top,6)
                        HStack(spacing: 4) {
                            ForEach(fav.genre_ids, id: \.self) { id in
                            if let index = videos.genres.firstIndex(where: { $0.id == id }) {
                                Text(videos.genres[index].name)
                                    .font(.Akaya(size: 20))
                                    .foregroundColor(Color("BelizeHole"))
                            }
                        }
                        }
                        .padding(.horizontal,20)
                        .padding(.top,10)
                        NavigationLink(
                            destination: FavTrailerListView(videos: videos, fav: fav),
                            label: {
                                Label("Trailer", systemImage: "play.tv.fill")
                                    .font(.Akaya(size: 20))
                                    .foregroundColor(Color("BelizeHole"))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal,20)
                                    .padding(.top,10)
                            })
                    }
                    VStack {
                        if posters.count > 0 {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                ForEach(posters) { poster in
                                KFImage(URL(string: poster.file_path)!)
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width-40)
                                    .cornerRadius(40)
                                    .overlay(
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 40)
                                                .stroke(Color("SourLemon"), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                        }
                                        
                                    )
                                    .padding(.horizontal,20)
                                    .padding(.vertical,10)

                            }
                                }
                            }
                    }
                }
                }
            }
            .onAppear {
                videos.LoadImages(id: Int(fav.id), isMovie: fav.is_movie) { (returnedPosters) in
                    posters.append(contentsOf: returnedPosters)
                }
            }
            .navigationBarTitle(fav.title_wrapepd, displayMode: .inline)
            .navigationBarColor(UIColor(named: "BelizeHole"))
            .toolbar {
                // Es para poner el título
                ToolbarItem(placement: .principal) {
                    Text(fav.title_wrapepd)
                        .font(.Akaya(size: 24))
                        .foregroundColor(Color("Alizarin"))
                }
            }
        }
    }
}

struct FavoritesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesDetailView(videos: MediaModel(), fav: Favorites())
    }
}
