//
//  URLRequests.swift
//  Diago
//
//  Created by Cesar Gamez on 1/29/23.
//

import Foundation

public func sendQuery() {
    print("Function recieved")
    if let url = URL(string: "http://137.184.8.74:3001/clip1.m4a") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
             if let jsonString = String(data: data, encoding: .utf8) {
                print(jsonString)
             }
           }
       }.resume()
    }
}
