//
//  PosterCollectionViewCell.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/15/24.
//

import UIKit
import Nuke

class PosterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with film: Film){
        
        let posterPathUrl = "https://image.tmdb.org/t/p/original/" + film.poster_path.absoluteString
        
        Nuke.loadImage(with: URL(string: posterPathUrl), into: posterImageView)
        
    }
    
}
