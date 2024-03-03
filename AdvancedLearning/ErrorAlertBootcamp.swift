//
//  ErrorAlertBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-03.
//

import SwiftUI

struct ErrorAlertBootcamp: View {
    
    @State private var errorTitle: String? = nil
    @State private var showError: Bool = false
    
    var body: some View {
        Button("CLICK ME!") {
            saveData()
        }
        .alert(errorTitle ?? "Error", isPresented: Binding(value: $errorTitle)) { // from last video
            Button("OK") {
                
            }
        }
    }
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            // do something
        } else {
            // error
            errorTitle = "An error occured"
            showError.toggle()
        }
    }
}

#Preview {
    ErrorAlertBootcamp()
}
