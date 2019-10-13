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
    @State var inputVisible: Bool = false
    @ObservedObject var room: Room
    
    var animation: Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(0.5)
            .delay(0.15)
    }
    
    var body: some View {
        VStack (alignment: .center){
            
            Image("iconemptybg").resizable()
                .frame(width: 320, height: 320)
                .clipShape(Circle())
                .padding()
                .animation(.spring())
            if inputVisible {
                VStack {
                    Text("Enter a room number:")
                        .bold()
                        .font(.custom("Calibri", size:24))
                    TextField("Ex: 1331",text:$inputtedNumber)
                        .padding(EdgeInsets(top:3, leading: 40, bottom: 5, trailing: 40))
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                        .clipShape(RoundedRectangle(cornerRadius:8))
                        
                        .padding()
                }.animation(animation)
            }
           
            HStack(alignment: .center) {
                
                Button(action: create) {
                    HStack{
                        Image(systemName:"plus.circle")
                        Text("Create")
                            .foregroundColor(Color.white)
                            .lineLimit(4)
                    }
                }.padding().background(Color.black).cornerRadius(20)
                    .shadow(radius:30)
        
                Button(action: join) {
                    HStack{
                        Image(systemName:"person.badge.plus")
                        Text("Join")
                            .foregroundColor(Color.white)
                    }
                }.padding().background(Color.black).cornerRadius(20)
                    .shadow(radius:30)
            
                
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
        if inputVisible {
            room.connectWithRoom(room: inputtedNumber)
        } else {
            inputVisible = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(room: Room(text:""))
    }
}
