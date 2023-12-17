//
//  ProtocolsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-17.
//

import SwiftUI

struct DefaultColorTheme {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct ProtocolsBootcamp: View {
    
//    let colorTheme: DefaultColorTheme = DefaultColorTheme()
    let colorTheme: AlternativeColorTheme = AlternativeColorTheme()
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text("Protocols are awesome!")
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProtocolsBootcamp()
}
