//
//  Extensions.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI

let apikey = "587fc64057a5a237cee6a534fd6bc390"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ODdmYzY0MDU3YTVhMjM3Y2VlNmE1MzRmZDZiYzM5MCIsInN1YiI6IjYwNzMwM2ZmNzc3NmYwMDAyOTdlYjJhMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2-uTs-8BUtuwGKkqfDcRyB21Ks86YsUzXE6p6zk5RyU"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]

extension Media {
    
    public static var defaultMedia = Media(name: "Wonder Woman 1984", year: 2020, rated: .B, genre: "Fantasy, Action, Adventure", duration: "2h 32m", headline: "A new era of wonder begins.", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.", score: 69, images: ["WonderWoman1","WonderWoman2","WonderWoman3","WonderWoman4","WonderWoman5"], logo: "WonderWomanLogo", trailer: "https://youtu.be/sfM7_JLk-84")
    
}
