//
//  ShapeAnimationLayer.swift
//  AppStore_PP
//
//  Created by Oleg on 12.12.2021.
//

import Foundation
import UIKit


extension DetailViewController {
    
    func configShapeLayer(_ shapeLayer: CAShapeLayer) {
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
