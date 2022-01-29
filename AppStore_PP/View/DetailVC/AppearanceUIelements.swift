//
//  AppearanceUIelements.swift
//  AppStore_PP
//
//  Created by Oleg on 08.12.2021.
//

import Foundation
import UIKit

    class AppearanceUIelements {
        static var share = AppearanceUIelements()
        private init() {}
    
        func appearanceUIelements(colorView: UIView,
                                  loadBuyButton: UIButton,
                                  detailName: UILabel,
                                  detailImage: UIImageView,
                                  detailPrice: UILabel,
                                  detailWallet: UILabel,
                                  view: UIView!) {
            
        colorView.layer.shadowOpacity = 8
        colorView.layer.shadowRadius = 8
        colorView.layer.cornerRadius = 25
        colorView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        loadBuyButton.layer.shadowOpacity = 0.5
        loadBuyButton.layer.shadowRadius = 3
        loadBuyButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        detailName.textColor = view.backgroundColor
        detailImage.layer.cornerRadius = 15
        detailImage.layer.shadowOpacity = 0.5
        detailImage.layer.shadowRadius = 3
        detailImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        detailPrice.textColor = view.backgroundColor
        detailPrice.layer.cornerRadius = 7
        detailPrice.clipsToBounds = true
        
        detailWallet.text = "Счет: \(DetailModel.share.myWallet) ₽"
        detailWallet.textColor = view.backgroundColor
        
        if DetailModel.share.priceData == nil {
            detailPrice.isHidden = true
            loadBuyButton.setTitle("Загрузить", for: .normal)
            loadBuyButton.setTitleColor(UIColor.red, for: .normal)
            loadBuyButton.backgroundColor = view.backgroundColor
            loadBuyButton.layer.cornerRadius = 15
            loadBuyButton.setTitleColor(.white, for: .normal)
        } else {
            detailPrice.text = "\(DetailModel.share.priceData!) ₽"
            loadBuyButton.setTitle("Купить ₽", for: .normal)
            loadBuyButton.backgroundColor = .systemGreen
            loadBuyButton.layer.cornerRadius = 15
            loadBuyButton.setTitleColor(.white, for: .normal)
        }
        
    }
}
