//
//  Video.swift
//  App07-MoviesSeries-TMDB
//
//  Created by Enrique Diaz de leon Hicks on 4/11/21.
//
// Struct for saving data for each movie/series

import SwiftUI

struct Video: Identifiable {
    
    var id: Int
    var title: String
    var overview: String
    var genre_ids: [Int]
    var poster_path: String
    var release_date: String
    var vote_average: Double
    
}
