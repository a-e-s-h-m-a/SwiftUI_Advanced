//
//  PropertyWrappersBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-05.
//

import SwiftUI

struct FileManagerProperty: DynamicProperty { // telling swiftUI that there is a dynamic property here
    @State var title: String = "Starting title"
    
    private var path: URL {
        FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "custom_title.txt")
    }
    
    func load() {
        do {
            title = try String(contentsOf: path, encoding: .utf8)
            print("SUCCESS READ")
        } catch {
            print("ERROR READ: \(error)")
        }
    }
    
    func save(newValue: String) {
        do {
            try newValue.write(to: path, atomically: false, encoding: .utf8)
            title = newValue
            print("SUCCESS SAVE")
        } catch {
            print("ERROR SAVING \(error)")
        }
    }
}

struct PropertyWrappersBootcamp: View {
    
    var fileManagerProperty = FileManagerProperty()
    //@State private var title: String = "Starting title"
    
    var body: some View {
        VStack(spacing: 30) {
            Text(fileManagerProperty.title).font(.largeTitle)
            
            Button("Click me 1") {
                fileManagerProperty.save(newValue: "title 1")
            }
            Button("Click me 2") {
                fileManagerProperty.save(newValue: "title 2")
            }
        }
        .onAppear {
            fileManagerProperty.load()
        }
    }
}

#Preview {
    PropertyWrappersBootcamp()
}
