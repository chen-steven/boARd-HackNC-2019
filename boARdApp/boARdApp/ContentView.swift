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
            
            
        }.edgesIgnoringSafeArea(.top)
    }
}
struct ContentView: View {
    @State var inputtedNumber: String = ""
    @ObservedObject var room: Room
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
            
            TextField("Room Number",text:$inputtedNumber)
                .padding(EdgeInsets(top:8, leading: 10, bottom: 5, trailing: 10))
                .background(Color.init(red:180/255, green: 180/255, blue: 180/255))
                .clipShape(RoundedRectangle(cornerRadius:8))
                .padding()
                
            Divider()
                .padding(.bottom)
            HStack {
                
                Button(action: create) {
                    Text("Create")
                        .foregroundColor(Color.white)
                        .lineLimit(4)
                }.padding().background(Color(red:122/255, green: 240/255, blue: 146/255)).cornerRadius(4)
                
                Button(action: join) {
                    Text("Join")
                        .foregroundColor(Color.white)
                }.padding().background(Color(red:122/255, green: 240/255, blue: 146/255)).cornerRadius(4)
                
                
            }
            
            
                
            Spacer()
            
        }
        .background(SwiftUI.Color(red:99/255, green:185/255, blue: 242/255).edgesIgnoringSafeArea(.all))
    }
    
    func create() {
        room.connect()
    }
    func join() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(room: Room(text:""))
    }
}
