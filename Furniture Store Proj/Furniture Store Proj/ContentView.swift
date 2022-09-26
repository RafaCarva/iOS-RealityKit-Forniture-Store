//
//  ContentView.swift
//  Furniture Store Proj
//
//  Created by Rafael Carvalho on 26/09/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    @StateObject private var vm = FurnitureViewModel()
    let furniture = ["sofa", "chair", "table", "armoire"]
    
    var body: some View {
        VStack {
            ARViewContainer().edgesIgnoringSafeArea(.all)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(furniture, id: \.self) { name in
                        Image(name)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .border(.green, width: vm.selectedFurniture == name ? 5.0: 0.0)
                            .onTapGesture {
                                vm.selectedFurniture = name
                            }
                        
                    }
                }
            }
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
