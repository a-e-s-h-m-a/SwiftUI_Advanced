//
//  PropertyWrappersBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-05.
//

import SwiftUI

extension FileManager {
    
    static func documentPath(key: String) -> URL {
        FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "\(key).txt")
    }
}

@propertyWrapper
struct FileManagerProperty: DynamicProperty {
     // telling swiftUI that there is a dynamic property here
    @State private var title: String
    let key: String
    
    var wrappedValue: String {
        get { title }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }
    
    init(wrappedValue: String, _ key: String) {
        self.key = key
        
        do {
            title = try String(contentsOf: FileManager.documentPath(key: key), encoding: .utf8)
            print("SUCCESS READ")
        } catch {
            title = wrappedValue
            print("ERROR READ: \(error)")
        }
    }
    
    func save(newValue: String) {
        do {
            try newValue.write(to: FileManager.documentPath(key: key), atomically: false, encoding: .utf8)
            title = newValue
            print("SUCCESS SAVE")
        } catch {
            print("ERROR SAVING \(error)")
        }
    }
}

struct PropertyWrappersBootcamp: View {
    
    @FileManagerProperty("custom_title_1") private var title1: String = "starting text 1"
    @FileManagerProperty("custom_title_2") private var title2: String = "starting text 2"
    @FileManagerProperty("custom_title_3") private var title3: String = "starting text 3"
    
//    @FileManagerProperty private var title: String
//    @FileManagerProperty private var title1: String
    //var fileManagerProperty = FileManagerProperty()
    //@State private var title: String = "Starting title"
    @State private var subtitle: String = "Subtitle"
    
    var body: some View {
        VStack(spacing: 30) {
            Text(title1).font(.largeTitle)
            Text(title2).font(.largeTitle)
            Text(title3).font(.largeTitle)
            PropertyWrapperChildView(subtitle: $title1)
            
            Button("Click me 1") {
                title1 = "title 1"
            }
            Button("Click me 2") {
                title1 = "title 2"
                title2 = "some random title"
            }
        }
    }
}

struct PropertyWrapperChildView: View {
    
    @Binding var subtitle: String
    
    var body: some View {
        Button(action: {
            subtitle = "another title"
        }, label: {
            Text(subtitle).font(.largeTitle)
        })
    }
}

#Preview {
    PropertyWrappersBootcamp()
}
