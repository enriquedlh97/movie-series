//
//  Genre.swift
//  App07-MoviesSeries-TMDB
//
//  Created by Enrique Diaz de Leon Hicks on 4/11/21.
//
// Struct for saving genre data the TMDB API requires only two fields
// which are id and name

import SwiftUI

struct Genre: Identifiable {
    
    var id: Int
    var name: String
    
}
