//
//  ButtonStyleBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-08.
//

import SwiftUI

struct ButtonPressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
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
        .buttonStyle(DefaultButtonStyle())
        .padding(40)
    }
}

#Preview {
    ButtonStyleBootcamp()
}
