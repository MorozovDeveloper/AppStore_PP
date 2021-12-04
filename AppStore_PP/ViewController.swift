//
//  ViewController.swift
//  AppStore_PP
//
//  Created by Oleg on 28.11.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var user: AppUser!
    var reference: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let currentUser = Auth.auth().currentUser else {return}// если не нашли текущего пользователя то выходим
        user = AppUser(user: currentUser)
        reference = Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }

////sdgsdgsd
}

