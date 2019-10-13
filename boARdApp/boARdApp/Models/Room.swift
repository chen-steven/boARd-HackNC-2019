//
//  Room.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import Foundation

class Room: ObservableObject{
    var text:String
    var roomNumber: Int
    
    init(text:String) {
        self.text = text
        self.roomNumber = 1331
    }
    func setText(text:String) {
        self.text = text
        
        //upload to database
    }
    func getText() -> String {
        return self.text
    }
}
