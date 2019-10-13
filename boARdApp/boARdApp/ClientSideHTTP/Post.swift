//
//  Post.swift
//  mainboARd
//
//  Created by Mariusz Derezinski-Choo on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//

import Foundation
func sendPOST(text: String, endpoint: String, id : String) -> Void{
    let message = Message(message: text, id: id)
    let postRequest = ServerRequest(endpoint: endpoint)
    POST(message: message, serverReq: postRequest)
}
