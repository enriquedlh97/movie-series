//
//  Section.swift
//  App07-MoviesSeries-TMDB
//
//  Created by Enrique Diaz de Leon Hicks on 4/11/21.
//

import SwiftUI

struct Section: Identifiable {
    
    var id: Int
    var name: String
    var image: String
    var imageUnselected: String
    
}

extension Section {
    
    public static let sections: [Section] = [
        Section(id: 0, name: "Now Playing", image: "ticket.fill", imageUnselected: "ticket"),
        Section(id: 0, name: "Popular", image: "star.fill", imageUnselected: "star"),
        Section(id: 0, name: "Top Rated", image: "crown.fill", imageUnselected: "crown")
    ]
    
}
