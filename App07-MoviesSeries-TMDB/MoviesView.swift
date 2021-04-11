//
//  MoviesView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var media: MediaModel
    @State var index: Int = 0
    
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
                                index = section.id
                                print("Selection: \(index)")
                            }, label: {
                                VStack {
                                    Image(systemName: section.image)
                                        .font(.title)
                                        .frame(height: 40)
                                    Text(section.name)
                                        .font(.Akaya(size: 18))
                                }
                                .foregroundColor(Color("SourLemon"))
                            })
                        }
                    }
                    .padding(.vertical, 10)
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(media.moviesNow) { movie in
//                                    NavigationLink(
//                                        destination: MediaDetailView(media: movie),
//                                        label: {
                                            MediaCellView(media: movie)
                                                .frame(width: geo.size.width)
//                                        })
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
