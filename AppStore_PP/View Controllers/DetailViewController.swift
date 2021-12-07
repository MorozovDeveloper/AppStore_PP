//
//  DetailViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailPrice: UILabel!
    @IBOutlet weak var detailWallet: UILabel!
    @IBOutlet weak var loadBuyButton: UIButton!
    @IBOutlet weak var colorView: UIView!
    
    var detailData = ""
    var imageData = ""
    var priceData: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailName.textColor = view.backgroundColor
        detailPrice.textColor = view.backgroundColor
        detailImage.layer.cornerRadius = 15
        detailImage.layer.borderWidth = 6
        detailImage.layer.borderColor = view.backgroundColor?.cgColor
        detailPrice.layer.cornerRadius = 7
        detailPrice.clipsToBounds = true

        colorView.layer.cornerRadius = 25
        colorView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        detailWallet.text = "Счет: \(2000.0) ₽"
        detailWallet.textColor = view.backgroundColor
        
        if priceData == nil {
            detailPrice.isHidden = true
            loadBuyButton.setTitle("Загрузить", for: .normal)
            loadBuyButton.backgroundColor = view.backgroundColor
            loadBuyButton.layer.cornerRadius = 15
            loadBuyButton.setTitleColor(.white, for: .normal)
        } else {
            detailPrice.text = "\(priceData!) ₽"
            loadBuyButton.setTitle("Купить ₽", for: .normal)
            loadBuyButton.backgroundColor = .systemGreen
            loadBuyButton.layer.cornerRadius = 15
            loadBuyButton.setTitleColor(.white, for: .normal)
            
        }
        
        guard let receivedImage = try? Data(contentsOf: URL(string: imageData)!) else {return}
        detailImage.image = UIImage(data: receivedImage)
        detailName.text = detailData

    }
    
}
