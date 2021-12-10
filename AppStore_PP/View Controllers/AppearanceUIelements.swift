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
        
        detailName.textColor = view.backgroundColor
        detailPrice.textColor = view.backgroundColor
        detailImage.layer.cornerRadius = 15
        detailImage.layer.borderWidth = 6
        detailImage.layer.borderColor = view.backgroundColor?.cgColor
        detailPrice.layer.cornerRadius = 7
        detailPrice.clipsToBounds = true
        
        colorView.layer.cornerRadius = 25
        colorView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        detailWallet.text = "Счет: \(myWallet) ₽"
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
        
    }
}
