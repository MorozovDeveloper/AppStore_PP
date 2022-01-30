//
//  Firebase.swift
//  AppStore_PP
//
//  Created by Oleg on 12.12.2021.
//

import Foundation
import UIKit
import Firebase

extension LoginViewController {
    
    func createLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            self.displayWarninfLabel(withText: "Info is incorrect")
            return
        }
        
        // для входа зарегестрированного юзера
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (user, error) in
            if error != nil {
                self?.displayWarninfLabel(withText: "Error occured")
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "ShowDetail", sender: nil)// если всё ОК то делай переход
            }
            
            self?.displayWarninfLabel(withText: "No such user")
        }
      )
    }
    
    func registerUser() {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarninfLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            guard error == nil, let user = authResult?.user else {
                print(error?.localizedDescription as Any)
                return
            }
            // для сохранения юзера в базе
            let userRef = self.reference.child(user.uid)
            userRef.setValue(user.email, forKey: "email")
            
        }
    }
    
}
