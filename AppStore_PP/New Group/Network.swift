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
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
        guard let url = URL(string: urlString) else {return}
        
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




//
//        var topFreeTableViewCell: TopFreeTableViewCell?
//
//        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
//        guard let url = URL(string: urlString) else {return}
//
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let data = data {
//                let currentData = self.parseJSON(withData: data)
//
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                    print("WWW, \(currentData?.name)")
//
//                }
//
//            }
//        }
//        task.resume()
//    }
//
//    func parseJSON(withData data: Data) -> CurrentManager? {
//        let decoder = JSONDecoder()
//
//        do {
//            let currentData = try decoder.decode(Model.self, from: data)
//            guard let currentApp = CurrentManager(model: currentData) else {
//                return nil
//            }
//            return currentApp
//        }
//
//        catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }

//}
//}
