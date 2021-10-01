//
//  APIModels.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 29/09/21.
//

import Foundation

struct ResultsResponse: Decodable {
    
    let items : [Results]
    
}


struct Results : Codable {
    
    var full_name : String
    var description : String
    var stargazers_count : Int?
    var forks_count : Int?
    
    
}
