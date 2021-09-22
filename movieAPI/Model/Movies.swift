//
//  Movies.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import Foundation

struct Result: Codable {
    var results : [ArrayResults]
}

struct ArrayResults: Codable{
    let id: Int
    let original_language: String
    let original_title: String
    let backdrop_path: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
    
}
