//
//  CurrentManager.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import Foundation

struct CurrentManager {
    
    let name: String
    
    
    
    
    
    
    init?(model: Model) {
        name = model.feed.results.first!.name
       // name = model.feed.title
    }
    
}
