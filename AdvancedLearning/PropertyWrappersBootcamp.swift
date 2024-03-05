//
//  PropertyWrappersBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-05.
//

import SwiftUI

struct PropertyWrappersBootcamp: View {
    
    @State private var title: String = "Starting title"
    
    var body: some View {
        VStack(spacing: 30) {
            Text(title).font(.largeTitle)
            
            Button("Click me 1") {
                setTitle(newValue: "title 1")
            }
            Button("Click me 2") {
                setTitle(newValue: "title 2")
            }
        }
    }
    
    private func setTitle(newValue: String) {
        title = newValue.uppercased()
    }
}

#Preview {
    PropertyWrappersBootcamp()
}
