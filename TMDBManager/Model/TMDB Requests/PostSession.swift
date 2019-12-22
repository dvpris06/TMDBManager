//
//  PostSession.swift
//  TMDBManager
//
//  Created by dragdimon on 22/12/2019.
//

import Foundation

struct PostSession: Codable {
    
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
    
}
