//
//  TopFreeTableViewCell.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import UIKit

class TopFreeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(with model: NetworkModel, cellForRowAt indexPath: IndexPath) {
        nameLabel.text = model.feed.results[indexPath.row].name
        descriptionLabel.text = model.feed.results[indexPath.row].genres.first?.name ?? ""
        
        DispatchQueue.global().async {
            guard let url = URL(string: (model.feed.results[indexPath.row].artworkUrl100)) else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            
            DispatchQueue.main.async {
                self.imageLabel.image = UIImage(data: imageData)
                self.imageLabel.layer.cornerRadius = 20
                self.imageLabel.clipsToBounds = true
            }
        }
    }
}
