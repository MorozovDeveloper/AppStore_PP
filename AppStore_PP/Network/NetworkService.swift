//
//  Network.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//

import Foundation
import UIKit


class NetworkService {

    func parse(url: URL, completion: @escaping (Result<Model, Error>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            
            do {
             let decode = JSONDecoder()
                let result = try decode.decode(Model.self, from: data)
                completion(.success(result))
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
 
}
