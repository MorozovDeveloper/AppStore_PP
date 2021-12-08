//
//  DetailViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import UIKit

class DetailViewController: UIViewController, CAAnimationDelegate {
    
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
        
        appearanceUIelements()
        
        //        guard let receivedImage = try? Data(contentsOf: URL(string: imageData)!) else {return}
        //        detailImage.image = UIImage(data: receivedImage)
        //        detailName.text = detailData
        
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
        
        configShapeLayer(shapeLayer)
        configShapeLayer(overShapeLayer)
        
    }
    
    
    @IBAction func actionButton(_ sender: UIButton) {
        
        if priceData == nil{
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.toValue = 1
            animation.duration = 2
            
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            animation.fillMode = CAMediaTimingFillMode.both
            animation.isRemovedOnCompletion = false
            
            animation.delegate = self
            
            overShapeLayer.add(animation, forKey: nil)
            
        }  else if priceData != nil {
            // pop-up menu
            
        }
        
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round // закругление
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            let color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
            shapeLayer.strokeColor = color
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            let color = UIColor.systemYellow.cgColor
            overShapeLayer.strokeColor = color
        }
    }
    
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
        doneLabel.textColor = .systemYellow
        view.addSubview(doneLabel)
    }
    
}




