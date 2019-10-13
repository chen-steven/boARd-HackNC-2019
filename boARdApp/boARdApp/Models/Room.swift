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
        self.roomNumber = "None"
    }
    
    func setRoomNumber(num: String) {
        roomNumber = num
    }
    func setText(text:String) {
        self.text = text
        
        //upload to database
    }
    func getText() -> String {
        return self.text
    }
    func connectWithRoom(room : String){
        self.roomNumber = room
        //assumes user puts right room number
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
                      if let unwrapper = String(data: data, encoding: .utf8){

                        dataString = unwrapper
                        self.roomNumber = dataString
                      }
              }
          }
          }
          task.resume()
      }
}
