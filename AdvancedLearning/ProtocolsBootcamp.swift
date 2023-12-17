//
//  ProtocolsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-17.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol {
    var primary: Color = .blue
    var secondary: Color = .red
    var tertiary: Color = .purple
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
}

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonDataSourceProtocol:ButtonTextProtocol, ButtonPressedProtocol {
    
}

class DefaultDataSource: ButtonDataSourceProtocol {
    func buttonPressed() {
        print("default button was pressed")
    }
    
    var buttonText: String = "Protocols are awesome!"
}

class AlternativeDataSource: ButtonDataSourceProtocol {
    func buttonPressed() {
        print("alternative button was pressed")
    }
    
    var buttonText: String = "Protocols are lame!"
}

struct ProtocolsBootcamp: View {

    let colorTheme: ColorThemeProtocol
    let dataSource: ButtonDataSourceProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary.ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundStyle(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

#Preview {
    ProtocolsBootcamp(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource())
}
