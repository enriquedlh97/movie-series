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
    @NSManaged public var genre_ids: [Int32]?
    @NSManaged public var overview: String?
    @NSManaged public var title: String?
    @NSManaged public var is_movie: Bool

}

extension Favorites : Identifiable {

}
