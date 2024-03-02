//
//  CustomBindingBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-02.
//

import SwiftUI

struct CustomBindingBootcamp: View {
    
    @State var title: String = "Start"
    
    var body: some View {
        VStack {
            Text(title)
            
            ChildView(title: $title)
        }
    }
}

struct ChildView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .onAppear {
                title = "new title"
            }
    }
}

#Preview {
    CustomBindingBootcamp()
}
