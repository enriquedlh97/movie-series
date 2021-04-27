//
//  MoviesView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var media: MediaModel
    @State var indexSelected: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("BelizeHole")
                VStack {
                    VStack {
                        Text("Movies")
                            .font(.Akaya(size: 48))
                            .foregroundColor(Color("SourLemon"))
                            .padding(.top,40)
                    }
                    HStack(spacing: 30) {
                        ForEach(Section.sections) { section in
                            Button(action: {
                                indexSelected = section.id
                                media.moviesList.removeAll()
                                media.moviesList.append(contentsOf: LoadMovies(list: indexSelected))
                            }, label: {
                                VStack {
                                    Image(systemName: section.id == indexSelected ? section.image : section.imageUnselected)
                                        .font(.title)
                                        .frame(height: 40)
                                    Text(section.name)
                                        .font(.Akaya(size: 18))
                                }
                                .foregroundColor(Color(section.id == indexSelected ? "SourLemon" : "Alizarin"))
                            })
                        }
                    }
                    .padding(.bottom, 10)
                    VStack {
                        if media.moviesList.count > 0 {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(media.moviesList) { movie in
                                    NavigationLink(
                                        destination: MediaDetailView(videos: media, media: movie, isMovie: true),
                                        label: {
                                            MediaCellView(media: movie, isMovie: true)
                                                .frame(width: geo.size.width)
                                        })
                                }
                            }
                            
                        }
                        } else {
                            Spacer()
                        }
                    }
                    .padding(.top,-6)
                }
                .padding(.bottom,80)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        }
    }
    
    func LoadMovies(list: Int) -> [Video] {
        switch list {
        case 0:
            return media.moviesNow
        case 1:
            return media.moviesPopular
        case 2:
            return media.moviesTop
        default:
            return media.moviesNow
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(media: MediaModel())
    }
}
