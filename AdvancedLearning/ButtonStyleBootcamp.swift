//
//  ButtonStyleBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("click me")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: .blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
        })
        .buttonStyle(PressableButtonStyle(scaledAmount: 0.5))
        .padding(40)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
