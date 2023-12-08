//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello world")
                .modifier(DefaultButtonViewModifier())
            
            Text("Hello everyone!")
                .modifier(DefaultButtonViewModifier())
            
            Text("Hello !!!")
                .modifier(DefaultButtonViewModifier())
        }
    }
}

#Preview {
    ViewModifierBootcamp()
}
