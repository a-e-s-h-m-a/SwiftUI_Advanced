//
//  UIViewRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-16.
//

import SwiftUI

//Converts UIView from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    var body: some View {
        VStack {
            Text("hello world")
            BacisUIViewRepresentable()
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}

struct BacisUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
