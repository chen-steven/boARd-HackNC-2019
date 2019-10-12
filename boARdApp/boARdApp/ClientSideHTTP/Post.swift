//
//  Post.swift
//  mainboARd
//
//  Created by Mariusz Derezinski-Choo on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//

import Foundation
func sendPOST(text: String, endpoint: String) -> String {
    let message = Message(message: text, id: 0)
    let postRequest = ServerRequest(endpoint: endpoint)
    let ret = POST(message: message, serverReq: postRequest)
    return ret
}
