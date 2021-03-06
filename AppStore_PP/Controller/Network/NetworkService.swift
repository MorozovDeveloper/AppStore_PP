//
//  Network.swift
//  AppStore_PP
//
//  Created by Oleg on 05.12.2021.
//


import UIKit


class NetworkService {
    static var share = NetworkService()
    private init() {}
    
    func parse(url: URL, completion: @escaping (Result<NetworkModel, Error>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {return}
            
            do {
                let decode = JSONDecoder()
                let result = try decode.decode(NetworkModel.self, from: data)
                completion(.success(result))
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
