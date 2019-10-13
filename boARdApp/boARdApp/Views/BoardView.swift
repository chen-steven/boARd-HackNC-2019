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
import SceneKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var text: String
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.debugOptions = [.showStatistics, .showFeaturePoints]
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        
        let anchor = AnchorEntity(plane: .horizontal, minimumBounds: [0.15, 0.15])
        arView.scene.anchors.append(anchor)
        let textMesh = MeshResource.generateText(
        text,
        extrusionDepth: 0.1,
        font: .systemFont(ofSize: 1.0),
        containerFrame: CGRect.zero,
        alignment: .left,
        lineBreakMode: .byTruncatingTail)
        
        let textMaterial = SimpleMaterial(color: UIColor.black, roughness: 0.0, isMetallic: false)
        let textModel = ModelEntity(mesh: textMesh, materials: [textMaterial])
        
        textModel.scale = SIMD3<Float>(0.1, 0.1, 0.1)
        //textModel.position = SIMD3<Float>(0.0, 0.0, -0.2)
        anchor.addChild(textModel)
        
        print("test")
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        print("test1")
       /* let textMesh = MeshResource.generateText(
        text,
        extrusionDepth: 0.1,
        font: .systemFont(ofSize: 1.0),
        containerFrame: CGRect.zero,
        alignment: .left,
        lineBreakMode: .byTruncatingTail)
        
        let textMaterial = SimpleMaterial(color: UIColor.yellow, roughness: 0.0, isMetallic: true)
        let textModel = ModelEntity(mesh: textMesh, materials: [textMaterial])
        textModel.scale = SIMD3<Float>(0.1, 0.1, 0.1)
        textModel.position = SIMD3<Float>(0.0, 0.0, -0.2)*/
        
    }
    
}



struct BoardView: View {
    @ObservedObject var room: Room
    var body: some View {
        return ARViewContainer(text: $room.text).edgesIgnoringSafeArea(.top)
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(room: Room(text:"test"))
    }
}
