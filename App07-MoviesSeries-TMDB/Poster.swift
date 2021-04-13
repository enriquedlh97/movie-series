//
//  Poster.swift
//  App07-MoviesSeries-TMDB
//
//  Created by Enrique Diaz de Leon Hicks on 4/12/21.
//

import SwiftUI

struct Poster: Identifiable {
     
    var id = UUID()
    var file_path: String
    var height: Int
    var width: Int
    var vote_average: Double
    
}
