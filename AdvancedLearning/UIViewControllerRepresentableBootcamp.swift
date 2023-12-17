//
//  UIViewControllerRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-17.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showScreen: Bool = false
    
    var body: some View {
        VStack {
            Text("Hi")
            Button(action: {
                showScreen.toggle()
            }, label: {
                Text("Click here")
            })
            .sheet(isPresented: $showScreen, content: {
                BasicUIViewControllerRepresentable()
            })
        }
    }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = "Hello world"
        label.textColor = .white
        
        vc.view.addSubview(label)
        label.frame = vc.view.frame
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
