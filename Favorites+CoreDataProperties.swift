//
//  Favorites+CoreDataProperties.swift
//  App08-TMDB-Favorites
//
//  Created by Enrique Diaz de Leon Hicks on 4/27/21.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var id: Int32
    @NSManaged public var poster_path: String?
    @NSManaged public var release_date: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var genre_ids: [Int32]
    @NSManaged public var overview: String?
    @NSManaged public var title: String?
    @NSManaged public var is_movie: Bool
    
    // These variables set the value to " " for when the variable is null
    var title_wrapepd: String {
        title ?? " "
    }
    var overview_wrapepd: String {
        overview ?? " "
    }
    var poster_path_wrapepd: String {
        poster_path ?? " "
    }
    var release_date_wrapepd: String {
        release_date ?? " "
    }

}

extension Favorites : Identifiable {

}
