//
//  Network.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import Foundation
import UIKit

extension TopFreeViewController {

     func parseAPI() {
        
        let freeUrlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
        guard let url = URL(string: freeUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                let jsonDecoder = JSONDecoder()
                self.model = try jsonDecoder.decode(Model.self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            catch {
                print(error, "ERROR")
            }
            
        }.resume()
    }
}


