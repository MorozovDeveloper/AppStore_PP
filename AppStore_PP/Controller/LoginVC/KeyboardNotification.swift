//
//  KeyboardNotification.swift
//  AppStore_PP
//
//  Created by Oleg on 12.12.2021.
///

import Foundation
import UIKit

extension LoginViewController {
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbDidShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        
    }
    
    @objc func kbDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else {return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        (self.view as! UIScrollView).contentSize = CGSize(
            width: self.view.bounds.size.width,
            height: self.view.bounds.size.height + kbFrameSize.height)
    }
    
    @objc func kbDidHide() {
        (self.view as! UIScrollView).contentSize = CGSize(
            width: self.view.bounds.width,
            height: self.view.bounds.height)
    }
    
    
    // Скрыть клавиатуру
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKB))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKB() {
        view.endEditing(true)
        
    }
}



