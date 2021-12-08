//
//  LoginViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 04.12.2021.
// test@mail.ru 123123

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let segueIdentifier = "ShowDetail"
    var reference: DatabaseReference! // для сохранения юзера
    
    @IBOutlet weak var warnLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warnLabel.alpha = 0
        // keyboard
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbDidShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(kbDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)

        reference = Database.database().reference(withPath: "users") // для сохранения юзера в базе

    }
  
    
    // keyboard
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
    
    func displayWarninfLabel(withText text: String) {
        warnLabel.text = text
        UIView.animate(withDuration: 4,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {[weak self] in self?.warnLabel.alpha = 1})
                       {[weak self] complete in self?.warnLabel.alpha = 0}
    }
    

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            self.displayWarninfLabel(withText: "Info is incorrect")
            return
        }
        
        // для входа зарегестрированного юзера
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] (user, error) in
            if error != nil {
                self?.displayWarninfLabel(withText: "Error occured") // проверяет зарегестрированного пользователя
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: self!.segueIdentifier, sender: nil)// если всё ОК то делай переход
            }
        
            self?.displayWarninfLabel(withText: "No such user")
        }
      )
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            displayWarninfLabel(withText: "Info is incorrect")
            return
        }
        // для регистрации нового юзера
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
