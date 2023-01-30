//
//  URLRequests.swift
//  Diago
//
//  Created by Cesar Gamez on 1/29/23.
//

import Foundation

public func sendQuery() -> String {
    var diag = ""
    if let url = URL(string: "http://137.184.8.74:3001/clip1.m4a") {
       URLSession.shared.dataTask(with: url) { data, response, error in
          if let data = data {
             if let jsonString = String(data: data, encoding: .utf8) {
                 let jsonData = jsonString.data(using: .utf8)!
                 do {
                     let diagnosis: Diagnosis = try! JSONDecoder().decode(Diagnosis.self, from: jsonData)
                     diag = diagnosis.result
                     print(diag)
                 } catch {
                     print("error")
                 }
             }
           }
       }.resume()
    }
    return diag
}

//let semaphore = DispatchSemaphore(value: 1)
//
//func sendQuery() -> String {
//    semaphore.wait()
//    var diag = "err"
//    if let url = URL(string: "http://137.184.8.74:3001/clip1.m4a") {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            defer { semaphore.signal() }
//            if let data = data {
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    let jsonData = jsonString.data(using: .utf8)!
//                    do {
//                        let diagnosis: Diagnosis = try! JSONDecoder().decode(Diagnosis.self, from: jsonData)
//                        diag = diagnosis.result
//                    } catch {
//                        print("error")
//                    }
//                }
//            }
//        }.resume()
//    }
//    return diag
//}

struct Diagnosis: Decodable {
    var result: String
}
