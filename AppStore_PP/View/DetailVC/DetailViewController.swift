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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppearanceUIelements.share.appearanceUIelements(colorView: colorView,
                                                        loadBuyButton: loadBuyButton,
                                                        detailName: detailName,
                                                        detailImage: detailImage,
                                                        detailPrice: detailPrice,
                                                        detailWallet: detailWallet,
                                                        view: view)
        
        guard let receivedImage = try? Data(contentsOf: URL(string: DetailModel.share.imageData)!) else {return}
                detailImage.image = UIImage(data: receivedImage)
        detailName.text = DetailModel.share.detailData
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DetailModel.share.shapeLayer = CAShapeLayer()
        view.layer.addSublayer(DetailModel.share.shapeLayer)
        
        DetailModel.share.overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(DetailModel.share.overShapeLayer)
        
        configShapeLayer(DetailModel.share.shapeLayer)
        configShapeLayer(DetailModel.share.overShapeLayer)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        if loadBuyButton.currentTitle == "Загрузить"{
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.toValue = 1
            animation.duration = 2
            
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
            animation.fillMode = CAMediaTimingFillMode.both
            animation.isRemovedOnCompletion = false
            
            animation.delegate = self
            
            DetailModel.share.overShapeLayer.add(animation, forKey: nil)
            
        }  else {
            alertController(title: "Купить?", message: "Со счета будет списано: \(DetailModel.share.priceData!) ₽")
        }
    }
    
    // Animation Wallet
    func displayWalletLabel(withText text: String) {
        detailWallet.text = text
        detailWallet.textColor = .red
        UIView.animate(withDuration: 2,
                       delay: 1,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {[weak self] in self?.detailWallet.alpha = 0})
        {[weak self] complete in self?.detailWallet.alpha = 1
            self?.detailWallet.text = "Счет: \(DetailModel.share.myWallet - DetailModel.share.priceData) ₽"
            self?.detailWallet.textColor = self?.view.backgroundColor}
    }
    
    func alertController (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Купить", style:  .default) { _ in
            
            if DetailModel.share.myWallet > DetailModel.share.priceData {
                self.detailWallet.text = "Счет: \(DetailModel.share.myWallet - DetailModel.share.priceData) ₽"
                self.detailPrice.text = "Куплено"
                self.loadBuyButton.setTitle("Загрузить", for: .normal)
                self.loadBuyButton.backgroundColor = self.view.backgroundColor
                self.loadBuyButton.layer.cornerRadius = 15
                self.loadBuyButton.setTitleColor(.white, for: .normal)
                self.displayWalletLabel(withText: "-\(DetailModel.share.priceData!)₽")
            } else {
                let alertError = UIAlertController(title: "Недостаточно средств", message: "Пополните баланс", preferredStyle: .alert)
                let alertActionError = UIAlertAction(title: "OK", style:  .default)
                self.present(alertError, animated: true)
                alertError.addAction(alertActionError)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        present(alert, animated: true)
        alert.addAction(cancelAction)
        alert.addAction(alertAction)
        
    }
    
 
}




