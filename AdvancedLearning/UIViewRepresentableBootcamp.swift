//
//  UIViewRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-16.
//

import SwiftUI

//Converts UIView from UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            TextField("Type here...", text: $text)
                .frame(height: 55)
                .background(.gray)
            
            UITextFieldViewRepresentable()
                .frame(height: 55)
                .background(.gray)
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        return getTextField()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    private func getTextField() -> UITextField {
        let placeHolder = NSAttributedString(
            string: "Type here...",
            attributes: [
                .foregroundColor: UIColor.red
            ]
        )
        
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = placeHolder
        return textField
    }
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
