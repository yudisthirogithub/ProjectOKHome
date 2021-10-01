//
//  Services.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 29/09/21.
//

import Foundation

class Services {
    static let shared = Services()

    
    // url : https://api.github.com/search/repositories?q=ProjectOKHOME
    
    
    func getResults(repositoryName: String, completed: @escaping (Result<ResultsResponse, ErrorMessages>) -> Void){
        
        let urlString = "https://api.github.com/search/repositories?q=\(repositoryName)"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {completed(.failure(.invalidData))
                
                return
            }
            
            //problemnya d sini
            do {
                let deconder = JSONDecoder()
//                deconder.keyDecodingStrategy = .convertFromSnakeCase
                
                let results = try deconder.decode(ResultsResponse.self, from: data)
                completed(.success(results))
                
            } catch {
                print("error ini woi")
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
}
