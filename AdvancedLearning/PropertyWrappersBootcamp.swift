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
        .onAppear {
            do {
                let savedTitle = try String(contentsOf: path, encoding: .utf8)
                title = savedTitle
                print("SUCCESS READ")
            } catch {
                print("ERROR READ: \(error)")
            }
        }
    }
    
    private func setTitle(newValue: String) {
        let uppercased = newValue.uppercased()
        title = uppercased
        save(newValue: uppercased)
    }
    
    private var path: URL {
        FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "custom_title.txt")
    }
    
    private func save(newValue: String) {
        do {
            try newValue.write(to: path, atomically: false, encoding: .utf8)
            print(NSHomeDirectory())
            print("SUCCESS SAVE")
        } catch {
            print("ERROR SAVING \(error)")
        }
    }
}

#Preview {
    PropertyWrappersBootcamp()
}
