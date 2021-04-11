//
//  MediaDetailView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct MediaDetailView: View {
    
    var media: Media
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text(media.overview)
                            .font(.Akaya(size: 24))
                            .foregroundColor(Color("BelizeHole"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,20)
                            .padding(.top,6)
                        Text(media.genre)
                            .font(.Akaya(size: 20))
                            .foregroundColor(Color("BelizeHole"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,20)
                            .padding(.top,10)
                        NavigationLink(
                            destination: WebView(html: media.trailer),
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
                        TabView {
                            ForEach(media.images, id:\.self) { image in
                                Image(image)
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
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    }
                }
            }
            .navigationBarTitle(media.name, displayMode: .inline)
            .navigationBarColor(UIColor(named: "BelizeHole"))
            .toolbar {
                // Es para poner el título
                ToolbarItem(placement: .principal) {
                    Text(media.name)
                        .font(.Akaya(size: 24))
                        .foregroundColor(Color("Alizarin"))
                }
            }
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(media: Media.defaultMedia)
    }
}
