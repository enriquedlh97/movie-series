//
//  Media.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

struct Media: Identifiable {
    
    var id = UUID()
    var name: String
    var year: Int
    var rated: Rated
    var genre: String
    var duration: String
    var headline: String
    var overview: String
    var score: Double
    var images: [String]
    var logo: String
    var trailer: String
    
}
