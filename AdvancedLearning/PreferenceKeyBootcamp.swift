//
//  PreferenceKeyBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-12.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text: String = "Hello"
    
    var body: some View {
        NavigationView {
            VStack {
                SecondaryView(title: text)
                    .navigationTitle("Navigation Title")
                    .preference(key: CustomTitlePreferenceKey.self, value: "New value") // setting the value for the preference key
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in // observe the preference key value & do the needful
            self.text = value
        })
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct SecondaryView: View {
    var title: String
    
    var body: some View {
        Text(title)
//            .preference(key: CustomTitlePreferenceKey.self, value: "New value")
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
