//
//  AddToFavoritesView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI

struct AddToFavoritesView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    var fetchRequest: FetchRequest<Favorites>
    var favorites: FetchedResults<Favorites> {
        fetchRequest.wrappedValue
    }
    
    var video: Video
    var isMovie: Bool
    
    var body: some View {
        VStack {
            // Checks if element is already in favorites
            if favorites.count == 0 {
                // If not, then adds fucntionality to add it
                Button(action: {
                    self.SaveVideoToFav(video: video, isMovie: isMovie)
                }) {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                }
            } else {
                // if it is, then adds functionality to take the element off
                Button(action: {
                    self.DeleteVideoFromFav(video: video)
                }) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24))
                }
            }
        }
    }
    
    init(video: Video, isMovie: Bool) {
        self.video = video
        self.isMovie = isMovie
        fetchRequest = FetchRequest<Favorites>(entity: Favorites.entity(), sortDescriptors: [],
                                               // Predicate is useful to validate if the id is equal to a particular value, in this case NSNumber
                                               predicate: NSPredicate(format: "id == %@", NSNumber(value: video.id)))
    }
    
    func SaveVideoToFav(video: Video, isMovie: Bool) {
        let m = Favorites(context: viewContext)
        m.id = Int32(video.id)
        m.title = video.title
        m.overview = video.overview
        m.release_date = video.release_date
        m.vote_average = video.vote_average
        m.poster_path = video.poster_path
        var arrGenre = [Int32]()
        for g in video.genre_ids {
            arrGenre.append(Int32(g))
        }
        m.genre_ids = arrGenre
        m.is_movie = isMovie
        try? viewContext.save()
        
    }
    
    func DeleteVideoFromFav(video: Video) {
        if let index = favorites.firstIndex(where: {$0.id == video.id}) {
            viewContext.delete(favorites[index])
            try? viewContext.save()
        }
    }
}

struct AddToFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        AddToFavoritesView(video: Video.defaultVideo, isMovie: true)
    }
}
