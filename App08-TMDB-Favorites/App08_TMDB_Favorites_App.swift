//
//  App04_MoviesSeriesApp.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

@main
struct App08_TMDB_Favorites_App: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MoviesSeriesView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
