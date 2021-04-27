//
//  FavoritesView.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @StateObject var media = MediaModel()
    // Manages the process of reading data from CoreData
    @FetchRequest(
        entity: Favorites.entity(),
        // This part indicates how the data is going to be ordered
        sortDescriptors: [NSSortDescriptor(key: "release_date", ascending: false)])
    // This variable holds and deliveres the results from the CoreData databse
    var favorites: FetchedResults<Favorites>
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("Alizarin")
                VStack(spacing: 0)  {
                    VStack {
                        Text("Favorites")
                            .font(.Akaya(size: 48))
                            .foregroundColor(Color("SourLemon"))
                            .padding(.top,  40)
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(favorites) { fav in
                            VStack{
                                FavoriteCellView(fav: fav)
                                    .frame(height: 200)
                                    .padding(.horizontal, 20)
                            }
                            .background(                           Color(fav.is_movie ? "BelizeHole" : "GreenSea")
                            )
                            // Adds options to the elements added (allows to delete)
                            .contextMenu {
                                Button {
                                    deleteFromFavorites(fav: fav)
                                } label: {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                }
                            }
                        }
                    }
                }
                // Contains the image for adding data
                VStack {
                    Spacer()
                    Button {
                        saveToFavorites()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("BelizeHole"))
                    }
                }
                .padding(.bottom, 100)
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
    
    func saveToFavorites() {
        
        // Holds data to be saved to entity
        let fav = Favorites(context: viewContext)
        fav.id = Int32(Video.defaultVideo.id)
        fav.title = Video.defaultVideo.title
        fav.overview = Video.defaultVideo.overview
        for genre in Video.defaultVideo.genre_ids {
            fav.genre_ids.append(Int32(genre))
        }
        fav.poster_path = Video.defaultVideo.poster_path
        fav.release_date = Video.defaultVideo.release_date
        fav.vote_average = Video.defaultVideo.vote_average
        fav.is_movie = true
        
        // The ? indicates that the process can fail
        try? viewContext.save()
        
    }
    
    func deleteFromFavorites(fav: Favorites) {
        // The recieved fav is deleted from the DB
        
        viewContext.delete(fav)
        try? viewContext.save()
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(media: MediaModel())
    }
}
