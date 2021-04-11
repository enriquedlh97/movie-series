//
//  SeriesView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct SeriesView: View {
    
    @StateObject var media: MediaModel
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("GreenSea")
                VStack {
                    VStack {
                        Text("Movies")
                            .font(.Akaya(size: 48))
                            .foregroundColor(Color("Alizarin"))
                            .padding(.top,40)
                    }
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(media.series) { serie in
                                    NavigationLink(
                                        destination: MediaDetailView(media: serie),
                                        label: {
                                            MediaCellView(media: serie)
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

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(media: MediaModel())
    }
}
