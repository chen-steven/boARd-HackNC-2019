//
//  ARView.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import SwiftUI
import UIKit
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
struct BoardView: View {
    @ObservedObject var room: Room
    var body: some View {
        ARViewContainer()
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(room: Room(text:"test"))
    }
}
