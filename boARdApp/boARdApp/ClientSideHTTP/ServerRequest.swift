//
//  ServerRequest.swift
//  mainboARd
//
//  Created by Mariusz Derezinski-Choo on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import Foundation

enum ServerError:Error{
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct ServerRequest {
    let resourceURL : URL
    init(endpoint: String) {
        let resourceString = "https://board1331.herokuapp.com/" + endpoint
        guard let resourceURL = URL(string: resourceString)else {fatalError()}
        self.resourceURL = resourceURL
    }
}
func POST(message: Message, serverReq: ServerRequest) -> String {
        var messageData = ""
        do{
            var urlRequest = URLRequest(url: serverReq.resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json",forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(message)

            let dataTask = URLSession.shared.dataTask(with: urlRequest){data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let
                    jsonData = data else {
                        return
                }
                
                do {
                    messageData = try JSONDecoder().decode(Message.self, from: jsonData).message
                } catch{
                }
            }
            dataTask.resume()
        }catch{
    }
    return messageData
}

