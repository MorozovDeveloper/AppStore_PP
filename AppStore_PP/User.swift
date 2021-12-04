//
//  User.swift
//  AppStore_PP
//
//  Created by Oleg on 04.12.2021.
//

import Foundation
import Firebase

struct AppUser {
    
    let uid: String
    let email: String
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email!
    }
    
}

