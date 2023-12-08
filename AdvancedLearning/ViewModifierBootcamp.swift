//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

// Add custom modifier...
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        self.modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierBootcamp: View {
    
    
    
    var body: some View {
        VStack {
            Text("Hello world")
                .font(.headline)
                .withDefaultButtonFormatting(backgroundColor: .green)
            
            Text("Hello everyone!")
                .font(.subheadline)
                .modifier(DefaultButtonViewModifier(backgroundColor: .blue))
            
            Text("Hello !!!")
                .modifier(DefaultButtonViewModifier(backgroundColor: .red))
        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
