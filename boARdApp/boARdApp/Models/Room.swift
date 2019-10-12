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
    init(text:String) {
        self.text = text
    }
    func setText(text:String) {
        self.text = text
        //upload to database
    }
    func getText() -> String {
        return self.text
    }
}
