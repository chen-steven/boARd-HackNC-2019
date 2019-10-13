//
//  ContentView.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import SwiftUI

struct AppContentView: View {
    @State private var selection = 0
    var room: Room
    //var room: Room = Room(text:"Join a room to collaborate")
    var body: some View {
        TabView(selection: $selection){
            ContentView(room: room)
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName:"person")
                        Text("Welcome")
                    }
                }
                .tag(0)
            EditView(room: room)
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName:"pencil.tip")
                        Text("Edit")
                    }
                }
                .tag(1)
            BoardView(room: room)
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName:"arkit")
                        Text("boARd")
                    }
            }.tag(2)
            
            
        }.edgesIgnoringSafeArea(.top).opacity(100.0)
    }
}
struct ContentView: View {
    @State var inputtedNumber: String = ""
    @ObservedObject var room: Room
    var body: some View {
        VStack {
            
            Image("iconemptybg").resizable()
                .frame(width: 320, height: 320)
                .clipShape(Circle())
                .padding()
            Text("Please enter a room number:")
                .bold()
                .font(.custom("Museo700-Regular.otf", size:18))
            
            TextField("Room Number",text:$inputtedNumber)
                .padding(EdgeInsets(top:8, leading: 10, bottom: 5, trailing: 10))
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding()
                
            Divider()
                .padding(.bottom)
            HStack {
                
                Button(action: create) {
                    HStack{
                        Image(systemName:"plus.circle")
                        Text("Create")
                            .foregroundColor(Color.white)
                            .lineLimit(4)
                    }
                }.padding().background(Color.black).cornerRadius(20)
                
                Button(action: join) {
                    HStack{
                        Image(systemName:"person.badge.plus")
                        Text("Join")
                            .foregroundColor(Color.white)
                    }
                }.padding().background(Color.black).cornerRadius(20)
                
                
            }
            
            
                
            Spacer()
            
        }
        .background(Image("mainbackground")).edgesIgnoringSafeArea(.top)
        //.background(SwiftUI.Color(red:99/255, green:185/255, blue: 242/255).edgesIgnoringSafeArea(.all))
    }
    
    func create() {
        room.connect()
    }
    func join() {
        room.connectWithRoom(room: inputtedNumber)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(room: Room(text:""))
    }
}
