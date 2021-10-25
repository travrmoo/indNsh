//
//  eventBriteAPI.swift
//  indNsh
//
//  Created by Travis Moody on 10/25/21.
//

import Foundation

final class eventBriteAPI {
    
    static let eventBriteShared = eventBriteAPI()
    
    func fetchEventBrite() {
        
        let eventBriteUrl = URL(string: "https://www.eventbriteapi.com/v3/venues/33781047/events/?token=A566EUCLJFKWQ5JPQFO4")!

        var request = URLRequest(url: eventBriteUrl)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let response = response {

            if let data = data, let body = String(data: data, encoding: .utf8) {
              print(data)
            }
          } else {
              
            print(error ?? "Unknown error")
              
          }
            let decoder = JSONDecoder()
            
            let json = try! JSONDecoder().decode(EventBriteJSON.self, from: data!)
            
            print(json)
        }
        task.resume()
    }
}


struct EventBriteJSON: Codable {
    
    var events: [Events]
    
    enum CodingKeys: String, CodingKey {
        case events
    }
}

struct Events: Codable {

    var url:String?
    var name:Name
    var start:Start

    enum CodingKeys: String, CodingKey {
        case url
        case name
        case start
    }
}

struct Name: Codable {

    var text:String?

    enum CodingKeys: String, CodingKey {
        case text
    }
}

struct Start: Codable {

    var local:String?

    enum CodingKeys: String, CodingKey {
        case local
    }
}
