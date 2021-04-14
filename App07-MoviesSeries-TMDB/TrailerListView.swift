//
//  TrailerListView.swift
//  App07-MoviesSeries-TMDB
//
//  Created by Enrique Diaz de Leon Hicks on 4/14/21.
//

import SwiftUI

struct TrailerListView: View {
    
    @StateObject var videos: MediaModel
    var media: Video
    var isMovie: Bool
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
            videos.LoadVideos(id: media.id, isMovie: isMovie) { (returnedTrailers) in
                trailers.removeAll()
                trailers.append(contentsOf: returnedTrailers)
            }
        }
        .navigationBarTitle(media.title, displayMode: .inline)
        .navigationBarColor(UIColor(named: "BelizeHole"))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(media.title)
                    .font(.Akaya(size: 24))
                    .foregroundColor(Color("Alizarin"))
            }
        }
    }
}

struct TrailerListView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerListView(videos: <#MediaModel#>, media: <#Video#>, isMovie: <#Bool#>)
    }
}
