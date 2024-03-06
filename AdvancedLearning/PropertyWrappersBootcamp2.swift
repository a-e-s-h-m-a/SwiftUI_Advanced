//
//  PropertyWrappersBootcamp2.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-06.
//

import SwiftUI

@propertyWrapper
struct Capitalized: DynamicProperty {
    
    @State private var value: String
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            value = newValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
}

@propertyWrapper
struct Uppercased: DynamicProperty {
    
    @State private var value: String
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            value = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue.uppercased()
    }
}

@propertyWrapper
struct FileManagerCodableProperty<T: Codable>: DynamicProperty {
     // telling swiftUI that there is a dynamic property here
    @State private var value: T?
    let key: String
    
    var wrappedValue: T? {
        get { value }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<T?> {
        Binding {
            wrappedValue
        } set: { newValue in
            wrappedValue = newValue
        }

    }
    
    init(wrappedValue: T?, _ key: String) {
        self.key = key
        
        do {
            let url = FileManager.documentPath(key: key)
            let data = try Data(contentsOf: url)
            let object = try JSONDecoder().decode(T.self, from: data)
            
            _value = State(wrappedValue: object)
            print("SUCCESS READ")
        } catch {
            _value = State(initialValue: wrappedValue)
            print("ERROR READ: \(error)")
        }
    }
    
    func save(newValue: T?) {
        do {
            let data = try JSONEncoder().encode(newValue)
            try data.write(to: FileManager.documentPath(key: key))
        
            value = newValue
            print("SUCCESS SAVE")
        } catch {
            print("ERROR SAVING \(error)")
        }
    }
}

struct User: Codable {
    let name: String
    let age: Int
    let isPremium: Bool
}


struct PropertyWrappersBootcamp2: View {
    
    //@Capitalized private var title: String = "Hello world"
    @Uppercased private var title: String = "Hello world"
    @FileManagerCodableProperty("user_profile") private var userProfile: User? = nil
    
    var body: some View {
        VStack {
            Button(title) {
                title = "new title"
            }
            Button(userProfile?.name ?? "no value") {
                userProfile = User(name: "NICK", age: 27, isPremium: true)
            }
        }
        .onAppear {
            print(NSHomeDirectory())
        }
    }
}

#Preview {
    PropertyWrappersBootcamp2()
}
