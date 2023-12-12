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
//                    .preference(key: CustomTitlePreferenceKey.self, value: "New value") // setting the value for the preference key
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in // observe the preference key value & do the needful
            self.text = value
        })
    }
}

extension View {
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

#Preview {
    PreferenceKeyBootcamp()
}

struct SecondaryView: View {
    var title: String
    @State private var newValue: String = ""
    
    var body: some View {
        Text(title)
//            .preference(key: CustomTitlePreferenceKey.self, value: "New value")
            .onAppear(perform: getDataFromDatabase)
            .customTitle(newValue)
    }
    
    func getDataFromDatabase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "new value from database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
