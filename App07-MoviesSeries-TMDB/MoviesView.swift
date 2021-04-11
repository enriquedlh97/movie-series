//
//  MoviesView.swift
//  App04-MoviesSeries
//
//  Created by David Cantú Delgado on 06/03/21.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var media: MediaModel
    
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
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(media.movies) { movie in
                                    NavigationLink(
                                        destination: MediaDetailView(media: movie),
                                        label: {
                                            MediaCellView(media: movie)
                                                .frame(width: geo.size.width)
                                        })
                                }
                            }
                            
                        }
                    }
                    .padding(.top,-6)
                }
                .padding(.bottom,80)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(media: MediaModel())
    }
}
