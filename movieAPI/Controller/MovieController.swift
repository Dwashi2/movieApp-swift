//
//  MovieController.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import Foundation
import Alamofire

class MovieInfoController{
    

    private var movies: [ArrayResults] = []
    var arrayMovies: [MovieModel] = []
    
    func count() -> Int {
        return self.arrayMovies.count
    }
    
    func currentMovie(index: Int) -> MovieModel {
        return self.arrayMovies[index]
    }
    
    func loadCurrentMovie(indexPath: IndexPath) -> MovieModel{
        return self.arrayMovies[indexPath.row]
    }
    
        
    
    func webRequest(completion: @escaping() -> Void) {
                AF.request("https://api.themoviedb.org/3/movie/now_playing?api_key=d767dfcb8d9a65623d2112f23a49f284&language=en-US&page=1").responseJSON { response in
                    if response.response?.statusCode == 200 {
                        if let data = response.data {
                            do {
                                let result: Result? = try JSONDecoder().decode(Result.self, from: data)
                                if let movieList = result?.results{
                                    for movie in movieList{
                                        let movieAdd = MovieModel(id: movie.id, original_language: movie.original_language, original_title: movie.original_title, backdrop_path: movie.backdrop_path, overview: movie.overview, popularity: movie.popularity, poster_path: movie.poster_path, release_date: movie.release_date, title: movie.title, video: movie.video, vote_average: movie.vote_average, vote_count: movie.vote_count)
                                        self.arrayMovies.append(movieAdd)
                                        
                                    }
                                }
                                    completion()
                                
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            }
    
    
    
}
