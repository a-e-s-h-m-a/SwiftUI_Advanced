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

struct PropertyWrappersBootcamp2: View {
    
    //@Capitalized private var title: String = "Hello world"
    @Uppercased private var title: String = "Hello world"
    
    var body: some View {
        VStack {
            Button(title) {
                title = "new title"
            }
        }
    }
}

#Preview {
    PropertyWrappersBootcamp2()
}
