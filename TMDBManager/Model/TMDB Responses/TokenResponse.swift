//
//  TokenResponse.swift
//  TMDBManager
//
//  Created by dragdimon on 22/12/2019.
//

import Foundation

struct TokenResponse: Codable {
    
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
