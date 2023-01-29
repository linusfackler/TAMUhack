//
//  FitBitAPI.swift
//  Diago
//
//  Created by Linus Fackler on 1/28/23.
//

import Foundation
import OAuthSwift

let tempKey = "********"
let clientSecret = "25ebeec2ee28ef6c75bb01a300c373da"
let redirectURL = "http://localhost"
let authorize_URL = "https://www.fitbit.com/oauth2/authorize"
let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzk5VkoiLCJzdWIiOiJCOU5WWFEiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd3BybyB3bnV0IHdzbGUgd3NvYyB3YWN0IHdveHkgd3RlbSB3d2VpIHdzZXQgd3JlcyB3bG9jIiwiZXhwIjoxNjc0OTk3Njk1LCJpYXQiOjE2NzQ5Njg4OTV9.I3FUmaVYVO-nMa0FsktTIMt9CHOPYxW51jxAVoRUwgA"

let contType = "application/x-www-form-urlencoded"

class FitBitAPI {
    
    static let shared = FitBitAPI()
    
    let oauth = OAuth2Swift(consumerKey: tempKey, consumerSecret: tempKey, authorizeUrl: authorize_URL, responseType: "token", contentType: contType)
    
    
    
//    OAuth2Swift(consumerKey: "********", consumerSecret: "********", authorizeUrl: "https://server.com/oauth/authorize", responseType: "code")
    
//    let handle = oauth.authorizeURLHandler
//            result in switch result
//            {
//                case .success(let (credential, response, parameters)):
//                    print(credential.oauthToken)
//                // Do your request
//                case .failure(let error):
//                    print(error.localizedDescription)
//            }
//    }
//
    
    let auth = OAuthSwiftClient.authorizationHeader(method: .GET, url: authorize_URL)
    
    func sendRequest () {
        
        
//        oauth.client.get("https://api.fitbit.com/1/user/-/profile.json") {
//            result in switch result {
//            case .success(let response):
//                let dataString = response.string
//                print(dataString)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        oauth.client.request("https://api.fitbit.com/1/user/-/profile.json", method: .GET, headers: ["Authorization" : auth], completionHandler completion: OAuthSwiftHTTPRequest.CompletionHandler?)
    }
    
    
//    oauthswift.accessTokenBasicAuthentification = true
//
//    guard let codeVerifier = generateCodeVerifier() else {return}
//    guard let codeChallenge = generateCodeChallenge(codeVerifier: codeVerifier) else {return}
//
    private init() {}
}
