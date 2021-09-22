//
//  CustomCell.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var titleMovieLabel: UILabel!
  //  @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: MovieModel ){

        self.titleMovieLabel.text = "\(value.title)"
        
        let url = URL(string: "https://image.tmdb.org/t/p/w154/" + value.backdrop_path)
        
        self.img.downloadImage(from: url!)
    }
    
}

extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}

