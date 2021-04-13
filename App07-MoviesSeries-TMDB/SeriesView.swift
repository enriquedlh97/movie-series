//
//  SeriesView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct SeriesView: View {
    
    @StateObject var media: MediaModel
    @State var indexSelected: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color("GreenSea")
                VStack {
                    VStack {
                        Text("Series")
                            .font(.Akaya(size: 48))
                            .foregroundColor(Color("Alizarin"))
                            .padding(.top,40)
                    }
                    HStack(spacing: 30) {
                        ForEach(Section.sections) { section in
                            Button(action: {
                                indexSelected = section.id
                                media.seriesList.removeAll()
                                media.seriesList.append(contentsOf: LoadSeries(list: indexSelected))
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
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(media.seriesList) { serie in
//                                    NavigationLink(
//                                        destination: MediaDetailView(media: serie),
//                                        label: {
                                            MediaCellView(media: serie)
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
    func LoadSeries(list: Int) -> [Video] {
        switch list {
        case 0:
            return media.seriesNow
        case 1:
            return media.seriesPopular
        case 2:
            return media.seriesTop
        default:
            return media.seriesNow
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(media: MediaModel())
    }
}
