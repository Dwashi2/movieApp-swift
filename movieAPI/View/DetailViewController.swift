//
//  DetailViewController.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import UIKit

class DetailViewController:UIViewController {
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var voteAverage: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var OverView: UILabel!
    var movieSelected: MovieModel?
    
    @IBOutlet weak var voteCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.titleLabel.text = "\(self.movieSelected?.title ?? "")"
        self.voteAverage.text = "Vote Average: \(self.movieSelected?.vote_average ?? 0)"
        self.OverView.text = "\(self.movieSelected?.overview ?? "")"
        self.popularity.text = "Popularity: \(self.movieSelected?.popularity ?? 0)"
        self.voteCount.text = "Vote Count: \(self.movieSelected?.vote_count ?? 0)"
        
        //self.imageMovie.image = UIImage
        let url = URL(string: "https://image.tmdb.org/t/p/w154/" + self.movieSelected!.backdrop_path)
        self.imageMovie.downloadImage(from: url!)
        
    }
}

