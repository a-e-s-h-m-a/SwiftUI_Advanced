//
//  ButtonStyleBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat) { // default value for parameter
        self.scaledAmount = scaledAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("click me")
                .font(.headline)
                .withDefaultButtonFormatting()
        })
//        .buttonStyle(PressableButtonStyle())
        .withPressableStyle()
        .padding(40)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
