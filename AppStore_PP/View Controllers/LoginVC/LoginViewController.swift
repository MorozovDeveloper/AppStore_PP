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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
        warnLabel.alpha = 0
        
        reference = Database.database().reference(withPath: "users") // для сохранения юзера в базе
        
        registerKeyboardNotification()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
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
    
    // Проверка зарегестрированного пользователя
    @IBAction func loginTapped(_ sender: UIButton) {
        createLogin()
    }
    // Регистрация нового юзера
    @IBAction func registerTapped(_ sender: UIButton) {
        registerUser()
    }
}
