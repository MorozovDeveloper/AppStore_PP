//
//  TopPaidTableViewCell.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import UIKit

class TopPaidTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func configure(with model: NetworkModel, cellForRowAt indexPath: IndexPath) {
        nameLabel.text = model.feed.results[indexPath.row].name
        descriptionLabel.text = model.feed.results[indexPath.row].genres.first?.name ?? ""
        priceLabel.text = "\(DetailModel.share.fakePrice.randomElement()!) ₽"
        priceLabel.layer.cornerRadius = 7
        priceLabel.clipsToBounds = true
        priceLabel.layer.borderWidth = 0.2
        priceLabel.layer.borderColor = UIColor.black.cgColor
        
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
