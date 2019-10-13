//
//  Message.swift
//  mainboARd
//
//  Created by Mariusz Derezinski-Choo on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//

import Foundation

final class Message: Codable {
    var id : String
    var message:String
    
    init(message: String, id: String){
        self.message = message
        self.id = id
    }
}
