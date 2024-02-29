//
//  FilmsDetailsViewController.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/4/24.
//

import Foundation
import UIKit
import Nuke

class FilmsDetailsViewController: UIViewController {
    
    var film: Film!
    
    @IBOutlet weak var filmImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteAvgLabel: UILabel!
    @IBOutlet weak var voteCntLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backdropPathUrl = "https://image.tmdb.org/t/p/original/" + film.backdrop_path.absoluteString
        Nuke.loadImage(with: backdropPathUrl, into: filmImg)
        
        titleLabel.text = film.title
        voteAvgLabel.text = "Vote Average: " + String(film.vote_average)
        voteCntLabel.text = "Vote Count: " + String(film.vote_count)
        popularityLabel.text = "Popularity: " + String(film.popularity)
        descriptionLabel.text = film.overview
        
    }
}
