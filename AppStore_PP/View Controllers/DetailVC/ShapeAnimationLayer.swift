//
//  ShapeAnimationLayer.swift
//  AppStore_PP
//
//  Created by Oleg on 12.12.2021.
//

import Foundation
import UIKit

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

extension DetailViewController {
    
        func configShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath() // траектория
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath // присвоение траектории
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let doneLabel = UILabel()
        doneLabel.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2 + 15, width: 200, height: 25)
        doneLabel.backgroundColor = view.backgroundColor
        doneLabel.text = "Загружено"
        doneLabel.textAlignment = .center
        doneLabel.textColor = colorView.backgroundColor
        view.addSubview(doneLabel)
    }
    
}
