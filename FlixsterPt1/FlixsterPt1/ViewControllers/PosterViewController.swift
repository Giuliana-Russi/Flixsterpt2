//
//  PosterViewController.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/15/24.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCollectionViewCell", for: indexPath) as! PosterCollectionViewCell
        
        let film = films[indexPath.item]
        let posterPathUrl = "https://image.tmdb.org/t/p/original/" + film.poster_path.absoluteString
        Nuke.loadImage(with: URL(string: posterPathUrl), into: cell.posterImageView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let chosenFilm = films[indexPath.item]
            //print("inside of collection view")
            performSegue(withIdentifier: "PosterDetails", sender: chosenFilm)
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isUserInteractionEnabled = true
        collectionView.delegate = self
        collectionView.allowsSelection = true
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c33fdfe9461c416434667a9bc80b2e93")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            guard let data = data else {
                print("❌ Data is nil")
                return
            }
         
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(FilmsResponse.self, from: data)
                
                let films = response.results
                print("✅ \(films)")
                
                DispatchQueue.main.async {
                    
                    self?.films = films
                    self?.collectionView.reloadData()
                    
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
        
        collectionView.dataSource = self
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
    

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("inside prepare")
        if segue.identifier == "PosterDetails",
           let chosenFilm = sender as? Film,
           let filmsDetailsViewController = segue.destination as? FilmsDetailsViewController {
                filmsDetailsViewController.film = chosenFilm
        }
    }


}
