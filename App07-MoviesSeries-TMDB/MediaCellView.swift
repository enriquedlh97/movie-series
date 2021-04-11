//
//  MediaCellView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI
import Kingfisher

struct MediaCellView: View {
    
    var media: Video
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    VStack {
                        KFImage(URL(string: media.poster_path)!)
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width-40)
                            .cornerRadius(40)
                            .overlay(
                                ZStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("SourLemon"), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                    VStack {
                                        Spacer()
                                        HStack {
                                            ScoreView(score: media.vote_average * 10)
                                            Spacer()
                                        }
                                        .padding(.leading,40)
                                        .padding(.bottom,-35)
                                    }
                                }
                                
                            )
                            .padding(.horizontal,20)
                            .padding(.top,10)
                        
                    }
                    
                    
                }
                VStack {
                        Text(media.title)
                            .font(.Akaya(size: 24))
                        Text("(\(String(media.release_date)))")
                            .font(.Akaya(size: 20))
                        Spacer()
                }
                .foregroundColor(Color("SourLemon"))
                .padding(.top,40)
                .padding(.leading,20)

            }
        }
    }
}

struct MediaCellView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCellView(media: Video.defaultVideo)
    }
}
