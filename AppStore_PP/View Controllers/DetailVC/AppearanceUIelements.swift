//
//  AppearanceUIelements.swift
//  AppStore_PP
//
//  Created by Oleg on 08.12.2021.
//

import Foundation
import UIKit

extension DetailViewController {
    
    func appearanceUIelements() {
        
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
        
        detailWallet.text = "Счет: \(myWallet) ₽"
        detailWallet.textColor = view.backgroundColor
        
        if priceData == nil {
            detailPrice.isHidden = true
            loadBuyButton.setTitle("Загрузить", for: .normal)
            loadBuyButton.setTitleColor(UIColor.red, for: .normal)
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
        
    }
}
