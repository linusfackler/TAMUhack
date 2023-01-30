//
//  FitBitAPI.swift
//  Diago
//
//  Created by Linus Fackler on 1/28/23.
//

import Foundation
import OAuthSwift
import SafariServices
import UIKit

let clientSecret = "25ebeec2ee28ef6c75bb01a300c373da"
let redirectURL = "http://localhost"
let authorize_URL = "https://www.fitbit.com/oauth2/authorize"
let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzk5VkoiLCJzdWIiOiJCOU5WWFEiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd3BybyB3bnV0IHdzbGUgd3NvYyB3YWN0IHdveHkgd3RlbSB3d2VpIHdzZXQgd3JlcyB3bG9jIiwiZXhwIjoxNjc0OTk3Njk1LCJpYXQiOjE2NzQ5Njg4OTV9.I3FUmaVYVO-nMa0FsktTIMt9CHOPYxW51jxAVoRUwgA"

let authorizationValue = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzk5VkoiLCJzdWIiOiJCOU5WWFEiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd3BybyB3bnV0IHdzbGUgd3NvYyB3YWN0IHdveHkgd3RlbSB3d2VpIHdzZXQgd3JlcyB3bG9jIiwiZXhwIjoxNjc0OTk3Njk1LCJpYXQiOjE2NzQ5Njg4OTV9.I3FUmaVYVO-nMa0FsktTIMt9CHOPYxW51jxAVoRUwgA"

let code_verifier = "9ZiDO1PGMrwYWGInhyHmLLI9h9hr8Ein8qgbyJxMGDT8QgXMULg18DJbdA7zsZIRIfVtn1YoQN1QHlD8"
let code_challenge = "nVbYLjFOEiwLR--KyPBRA4g3anmJavnkg_-xP5A4jYU"

let contType = "application/x-www-form-urlencoded"

let postUrl = "https://api.fitbit.com/oauth2/token"
let userScope = "activity heartrate location nutrition oxygen_saturation profile respiratory_rate settings sleep social temperature weight"

let tempURL = "https://www.fitbit.com/oauth2/authorize?client_id=2399VJ&response_type=code&code_challenge=nVbYLjFOEiwLR--KyPBRA4g3anmJavnkg_-xP5A4jYU&code_challenge_method=S256&scope=activity%20heartrate%20location%20nutrition%20oxygen_saturation%20profile%20respiratory_rate%20settings%20sleep%20social%20temperature%20weight"


class FitBitAPI {
    
    static let shared = FitBitAPI()
    
    let oauth = OAuth2Swift(consumerKey: "2399VJ", consumerSecret: "a67aa57d189517d7224045f3fcddbcb6", authorizeUrl: authorize_URL, responseType: "token", contentType: contType)
    

    static var textRes: String = " "
    
    func loginFitBit () {
        
        oauth.authorizeURLHandler = getURLHandler(a: oauth)

//        oauth.authorizeURLHandler = SafariURLHandler(viewController: UIApplication.shared.keyWindowPresentedController, oauthSwift: oauth)

        let state = generateState(withLength: 20)

        let handle = oauth.authorize(withCallbackURL: redirectURL, scope: userScope, state: state) {
            result in switch result {
            case .success(let response):
                print(response)
            case .failure(let response):
                print(response)
            }
        }
//    case .success(let (credential, _, _)):
//        print("almost there")
//        let aut = "Bearer " + credential.oauthToken
//        self.oauth.client.get("https://api.fitbit.com/1/user/-/profile.json", headers: ["authorization":aut]) {
//            result in switch result {
//            case .success(let response):
//                let dataString = response.string
//                print(dataString!)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    case .failure(let error):
//        print(error.localizedDescription)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//           print("5 seconds over")
//        }
//
        
        
        
//        let aut = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzk5VkoiLCJzdWIiOiJCOU5WWFEiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd251dCB3cHJvIHdzbGUgd3NvYyB3YWN0IHdveHkgd3RlbSB3d2VpIHdzZXQgd3JlcyB3bG9jIiwiZXhwIjoxNjc1MDM1NTkyLCJpYXQiOjE2NzUwMDY3OTJ9.e5eQBVyAyaQApi4Lq7IMVOiDiNCRKKxTFFvdn-BvhtY"
//        oauth.client.get("https://api.fitbit.com/1/user/B9NVXQ/profile.json", headers: ["authorization":aut]) {
//            result in switch result {
//            case .success(let response):
////                print(self.textResult)
//                self.textRes = response.string!
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//        print(self.textResult)
//        var res = dataString
//        print(res)
        
//        struct Information: Decodable {
//          let name: String
//        }
        
        
//        let jsonData = dataString.data(using: .utf8)!
        //let information = try JSONDecoder().decode(Information.self, from: jsonData)
        //print(information.name)
//        print(dataString)
        
//        return dataString
    }
    
    func getURLHandler(a: OAuth2Swift) -> OAuthSwiftURLHandlerType {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            print("oidsejfiojeosij")
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
                
            let handler = SafariURLHandler(viewController: topController, oauthSwift: a)
            
            handler.presentCompletion = {
                print("Safari presented")
            }
            handler.dismissCompletion = {
                print("Safari dismissed")
            }
            handler.factory = { url in
                let controller = SFSafariViewController(url: url)
                return controller
            }
            return handler;
        }
            return OAuthSwiftOpenURLExternally.sharedInstance
    }
    
//    private init() {}
}
