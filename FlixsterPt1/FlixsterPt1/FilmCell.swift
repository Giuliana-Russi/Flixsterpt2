//
//  FilmCell.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/3/24.
//

import UIKit
import Nuke

class FilmCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filmImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with film: Film){
        titleLabel.text = film.title
        descriptionLabel.text = film.overview
        
        let posterPathUrl = "https://image.tmdb.org/t/p/original/" + film.poster_path.absoluteString
        Nuke.loadImage(with: URL(string: posterPathUrl), into: filmImg)
        
    }

}
