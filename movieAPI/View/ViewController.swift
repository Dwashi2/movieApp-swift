//
//  ViewController.swift
//  movieAPI
//
//  Created by Daniel Washington Ignacio on 21/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var controller: MovieInfoController = MovieInfoController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.controller.webRequest {
            self.myTableView.reloadData()
        }
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCell? = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        cell?.setup(value: self.controller.loadCurrentMovie(indexPath: indexPath))

        return cell ?? UITableViewCell()
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieSelected: MovieModel = self.controller.loadCurrentMovie(indexPath: indexPath)
        performSegue(withIdentifier: "DetailViewController", sender: movieSelected)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc: DetailViewController? = segue.destination as? DetailViewController
        vc?.movieSelected = sender as? MovieModel

    }
    
    
}

