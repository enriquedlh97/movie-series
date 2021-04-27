//
//  FavTrailerListView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI

struct FavTrailerListView: View {
    
    @StateObject var videos: MediaModel
    var fav: Favorites
    @State var trailers = [Trailer]()
    
    var body: some View {
        VStack {
            List(trailers) { trailer in
                NavigationLink(destination: WebView(html: trailer.url),
                               label: {
                                VStack(alignment: .leading) {
                                    Text(trailer.name)
                                        .font(.Akaya(size: 24))
                                        .foregroundColor(Color("BelizeHole"))
                                    Text(trailer.type)
                                        .font(.Akaya(size: 18))
                                        .foregroundColor(Color("Alizarin"))
                                }
                               })
            }
        }
        .onAppear {
            videos.LoadVideos(id: Int(fav.id), isMovie: fav.is_movie) { (returnedTrailers) in
                trailers.removeAll()
                trailers.append(contentsOf: returnedTrailers)
            }
        }
        .navigationBarTitle(fav.title_wrapepd, displayMode: .inline)
        .navigationBarColor(UIColor(named: "BelizeHole"))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(fav.title_wrapped)
                    .font(.Akaya(size: 24))
                    .foregroundColor(Color("Alizarin"))
            }
        }
    }
}

struct FavTrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        FavTrailerListView(videos: MediaModel(), fav: Favorites())
    }
}
