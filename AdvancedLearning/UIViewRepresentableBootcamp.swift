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
                    .updatePlaceholder("Type here...")
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
    var placeholderText: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholderText: String = "Default placeholder...", placeholderColor: UIColor = .red) {
        self._text = text
        self.placeholderText = placeholderText
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    // Use this to send data from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let placeHolder = NSAttributedString(
            string: placeholderText,
            attributes: [
                .foregroundColor: placeholderColor
            ]
        )
        
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholderText = text
        return viewRepresentable
    }
    
    // Use this to send data from UIKit to SwiftUI
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
