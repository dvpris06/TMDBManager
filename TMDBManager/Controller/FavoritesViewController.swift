//
//  FavoritesViewController.swift
//  TMDBManager
//
//  Created by dragdimon on 22/12/2019.
//

import UIKit

class FavoritesViewController: UIViewController {

    //MARK: Outlets and Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex = 0
    
    //MARK: VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        TMDBClient.getFavorites() { movies, error in
            MovieModel.favorites = movies
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        tableView.reloadData()
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as! MovieDetailViewController
            detailVC.movie = MovieModel.favorites[selectedIndex]
        }
    }

}

    //MARK: TableView Methods

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieModel.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell")!
        
        let movie = MovieModel.favorites[indexPath.row]
        
        cell.textLabel?.text = movie.title
        cell.imageView?.image = UIImage(named: "PosterPlaceholder")
        if let posterPath = movie.posterPath {
            TMDBClient.downloadPosterImage(path: posterPath) { data, error in
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                cell.imageView?.image = image
                cell.setNeedsLayout()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
