//
//  DetailModel.swift
//  AppStore_PP
//
//  Created by Oleg on 25.12.2021.
//

import Foundation
import UIKit

class DetailModel {
    
    var detailData: String!
    var imageData: String!
    var priceData: Double!
    var myWallet = 3000.0
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round // закругление
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1912825248, green: 0.5740641828, blue: 0.736538669, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }

    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.7529411765, alpha: 1).cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
}