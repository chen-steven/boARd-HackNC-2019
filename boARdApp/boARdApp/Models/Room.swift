//
//  Room.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import Foundation

class Room: ObservableObject{
    @Published var text:String
    @Published var roomNumber: String
    
    init(text:String) {
        self.text = text
        self.roomNumber = "Notes"
    }
    
    func setRoomNumber(num: String) {
        roomNumber = num
    }
    func setText(text:String) {
        self.text = text
        sendPOST(text: self.text, endpoint : "PUSH", id: self.roomNumber)
    }
    func getText() -> Void{
        
        do {
            
            var text = "ERROR"
            //let message : Message = Message(message : "", id : self.roomNumber)
    
            let url = URL(string: "https://board1331.herokuapp.com/TEXT?id=" + self.roomNumber)!
            print(self.roomNumber)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            //urlRequest.addValue("application/json",forHTTPHeaderField: "Content-Type")
            //urlRequest.httpBody = try JSONEncoder().encode(message)
            let task = URLSession.shared.dataTask(with: urlRequest){data, response, _ in
            print(data)
            print(response)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let
                jsonData = data else {
                    return
            }
                
            do {
                self.parse(json: jsonData)
            } catch{
            }
            }
            
                task.resume()
            }
           catch {
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {self.getText()}
        
        
    }
    func connectWithRoom(room : String){
        self.roomNumber = room
        self.getText()
        //assumes user puts right room number
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try?
            decoder.decode(Session.self, from: json) {
            DispatchQueue.main.async() {
                self.text = jsonPetitions.text
                self.roomNumber = jsonPetitions.room
            }
        }
        
    }
    func connect() {
        var dataString = "ERROR"
          let url = URL(string: "https://board1331.herokuapp.com/ROOM")!
          let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
              if let error = error {
                  print("error: \(error)")
              } else {
                  if let response = response as? HTTPURLResponse {
                      print("statusCode: \(response.statusCode)")
                  }
                  if let data = data{
                    do {
                            
                        self.parse(json:data)
                    } catch{
                    }
              }
          }
          }
          task.resume()
      }
    
    
}

struct Session: Codable {
    var room: String
    var text: String
}
