//
//  LogoutRequest.swift
//  TMDBManager
//
//  Created by dragdimon on 23/12/2019.
//

import Foundation

struct LogoutRequest: Codable {
    let sessionID: String
    
    enum CodingKeys: String, CodingKey {
        case sessionID = "session_id"
    }
}
