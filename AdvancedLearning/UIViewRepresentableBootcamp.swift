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
            HStack {
                Text("SwiftUI")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                    .background(.gray)
            }
            
            HStack {
                Text("UIKit")
                UITextFieldViewRepresentable(text: $text)
                    .frame(height: 55)
                    .background(.gray)
            }
        }
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> some UIView {
        
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
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
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
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
