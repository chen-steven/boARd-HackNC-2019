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
}
