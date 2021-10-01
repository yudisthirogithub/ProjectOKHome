//
//  APIModels.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 29/09/21.
//

import Foundation

struct ResultsResponse: Codable {
    
    let items : [Results]
//    let incomplete_results: Bool
//    let total_count: Int
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
//        case incomplete_results = "incomplete_results"
//        case total_count = "total_count"
    }
    
}


struct Results : Codable {
    
    var full_name : String
    var description : String
    var stargazers_count : Int?
    var forks_count : Int?
    
    
}
