//
//  ContentView.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    @State var roomNumber: String = ""
    //@EnvironmentObject var roomViewModel:RoomViewModel
    var body: some View {
        VStack {
            Text("Welcome to boARd")
                .font(.largeTitle)
                .bold()
                .padding(.top, 60)
            Image("logo").resizable()
                .frame(width: 256.0, height: 256.0)
                .clipShape(Circle())
            Text("Please enter a room number:")
                .bold()
                .font(.headline)
            
            TextField("Room Number",text:$roomNumber)
                .padding(EdgeInsets(top:8, leading: 10, bottom: 8, trailing: 10))
                .background(Color.init(red:180/255, green: 180/255, blue: 180/255))
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding()
            Button(action: submit) {
                Text("Join Room")
                    .foregroundColor(Color.white)
            }.padding().background(Color(red:99/255, green: 181/255, blue: 238/255)).cornerRadius(4)
            
                
            Spacer()
            
        }
        .background(SwiftUI.Color.green.edgesIgnoringSafeArea(.all))
    }
    
    func submit() {
        
        let test = sendPOST(text: "aksdjfasjdklf", endpoint: "Hello_World")
        print(test)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
