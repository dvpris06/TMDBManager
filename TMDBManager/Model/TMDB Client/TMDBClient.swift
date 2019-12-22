//
//  TMDBClient.swift
//  TMDBManager
//
//  Created by dragdimon on 20/12/2019.
//

import Foundation

class TMDBClient {
    
    static var apiKey = ""
    static func setAPIKey(_ key: String) {
        TMDBClient.apiKey = key
    }
    
    struct Auth {
        static var accountId = 0
        static var requestToken = ""
        static var sessionId = ""
    }
    
    enum Endpoints {
        static let base = "https://api.themoviedb.org/3"
        static let apiKeyParam = "?api_key=\(TMDBClient.apiKey)"
        
        case getRequestToken
        case createSessionID
        case login
        
        var stringValue: String {
            switch self {
            case .getRequestToken:
                return Endpoints.base + "/authentication/token/new" + Endpoints.apiKeyParam

            case .createSessionID:
                return Endpoints.base + "/authentication/session/new" + Endpoints.apiKeyParam
                
            case .login:
                return Endpoints.base + "/authentication/token/validate_with_login" + Endpoints.apiKeyParam
                
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
        
    }
    
    class func getRequestToken(completion: @escaping (Bool, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoints.getRequestToken.url) { data, response, error in
            guard let data = data else {
                completion(false, error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(TokenResponse.self, from: data)
                Auth.requestToken = responseObject.requestToken
                completion(true, nil)
            } catch {
                completion(false, error)
            }
        }
        task.resume()
    }
    
}
