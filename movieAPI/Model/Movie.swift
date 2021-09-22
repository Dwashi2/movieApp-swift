//
//  Movie.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import Foundation


class MovieModel: NSObject {
    var id: Int
    var original_language: String
    var original_title: String
    var backdrop_path: String
    var overview: String
    var popularity: Float
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Float
    var vote_count: Int
    
    init(id: Int, original_language: String, original_title: String, backdrop_path: String, overview: String, popularity: Float,poster_path: String, release_date: String, title: String, video: Bool,vote_average: Float, vote_count: Int) {
        
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.backdrop_path = backdrop_path
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
    
}
