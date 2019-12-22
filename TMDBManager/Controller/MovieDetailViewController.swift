//
//  MovieDetailViewController.swift
//  TMDBManager
//
//  Created by dragdimon on 22/12/2019.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var watchlistBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!
    
    var movie: Movie!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = movie.title
        self.tabBarController?.tabBar.isHidden = true
        
        
        if let posterPath = movie.posterPath {
            TMDBClient.downloadPosterImage(path: posterPath) { data, error in
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        }

        
    }
    

   

}
