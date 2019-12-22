//
//  SessionResponse.swift
//  TMDBManager
//
//  Created by dragdimon on 22/12/2019.
//

import Foundation

struct SessionResponse: Codable {
    
    let success: Bool
    let sessionID: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
    
}
