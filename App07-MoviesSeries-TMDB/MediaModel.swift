//
//  MediaModel.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI
import SwiftyJSON
import Alamofire

class MediaModel: ObservableObject {
    
    @Published var movies = [Media]()
    @Published var series = [Media]()
    @Published var genres = [Genre]()
    
    
    init() {
        LoadInfo()
        LoadGenres()
    }
    
    func LoadGenres() {
        let URL = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apikey)&language=en-US"
            
        // Makes request with specified parameters to get genres data
            AF.request(URL, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders(headers)).responseData { data in
                // Decodes the data saved in the data variable gotten by the .responseData
                let json = try! JSON(data: data.data!)
                var genre: Genre
                // Loops over array to get and save the data
                for g in json["genres"] {
                    // For each item a Genre object is created and the values given in the item are saved as object properties
                    genre = Genre(
                        id: g.1["id"].intValue,
                        name: g.1["name"].stringValue)
                    // One this is done, the objetc is appended to the genre array
                    self.genres.append(genre)
                }
            }
    }
    
    func LoadInfo() {
        
        var media: Media
        
        media = Media(name: "Tom & Jerry", year: 2020, rated: .PG, genre: "Action, Comedy, Family, Animation", duration: "1h 41m", headline: "Best of enemies. Worst of friends.", overview: "Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse.", score: 79, images: ["TomJerry1","TomJerry2","TomJerry3","TomJerry4","TomJerry5"], logo: "TomJerryLogo", trailer: "https://youtu.be/kP9TfCWaQT4")
        movies.append(media)
        media = Media(name: "Monster Hunter", year: 2020, rated: .PG13, genre: "Fantasy, Action, Adventure", duration: "1h 44m", headline: "Behind our world, there is another.", overview: "A portal transports Cpt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be their only hope to find a way home.", score: 73, images: ["MonsterHunter1","MonsterHunter2","MonsterHunter3","MonsterHunter4","MonsterHunter5"], logo: "MonsterHunterLogo", trailer: "https://youtu.be/3od-kQMTZ9M")
        movies.append(media)
        media = Media(name: "Wonder Woman 1984", year: 2020, rated: .B, genre: "Fantasy, Action, Adventure", duration: "2h 32m", headline: "A new era of wonder begins.", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.", score: 69, images: ["WonderWoman1","WonderWoman2","WonderWoman3","WonderWoman4","WonderWoman5"], logo: "WonderWomanLogo", trailer: "https://youtu.be/sfM7_JLk-84")
        movies.append(media)
        media = Media(name: "Friends", year: 1994, rated: .TV14, genre: "Comedy, Drama", duration: "25m", headline: "I'll be there for you", overview: "The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.", score: 84, images: ["Friends1","Friends2","Friends3","Friends4","Friends5"], logo: "FriendsLogo", trailer: "https://youtu.be/hDNNmeeJs1Q")
        series.append(media)
        media = Media(name: "WandaVision", year: 2021, rated: .TV14, genre: "Sci-Fi & Fantasy, Mystery, Drama", duration: "36m", headline: "Experience a new vision of reality.", overview: "Wanda Maximoff and Vision—two super-powered beings living idealized suburban lives—begin to suspect that everything is not as it seems.", score: 85, images: ["WandaVision1","WandaVision2","WandaVision3","WandaVision4","WandaVision5"], logo: "WandaVision2", trailer: "https://youtu.be/sj9J2ecsSpo")
        series.append(media)
        media = Media(name: "The Mandalorian", year: 2019, rated: .TV14, genre: "Sci-Fi & Fantasy, Action & Adventure, Western, Drama", duration: "35m", headline: "Bounty hunting is a complicated profession.", overview: "After the fall of the Galactic Empire, lawlessness has spread throughout the galaxy. A lone gunfighter makes his way through the outer reaches, earning his keep as a bounty hunter.", score: 85, images: ["TheMandalorian1","TheMandalorian2","TheMandalorian3","TheMandalorian4","TheMandalorian5"], logo: "TheMandalorianLogo", trailer: "https://youtu.be/eW7Twd85m2g")
        series.append(media)
    }
    
}
