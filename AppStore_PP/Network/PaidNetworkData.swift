//
//  PaidNetworkData.swift
//  AppStore_PP
//
//  Created by Oleg on 06.12.2021.
//

import Foundation
import UIKit

extension TopPaidViewController {
    
    func parseAPI() {
        
        let paidUrlSring = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json"
        guard let url = URL(string: paidUrlSring) else {return}
        
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
