//
//  CustomBindingBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-02.
//

import SwiftUI

struct CustomBindingBootcamp: View {
    
    @State var title: String = "Start"
    
    @State private var errorTitle: String? = nil
    //@State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
            
            ChildView(title: $title)
            
            // without using binding
            ChildView2(title: title) { newTitle in
                title = newTitle
            }
            
            ChildView3(title: $title)
            
            ChildView3(title: Binding(get: {
                return title
            }, set: { newValue in
                title = newValue
            }))
            
            Button("CLICK ME!") {
                errorTitle = "new error!"
                //showError.toggle()
            }
        }
        .alert(errorTitle ?? "Error", isPresented: Binding(get: {
            return errorTitle != nil
        }, set: { newValue in
            if !newValue {
                errorTitle = nil
            }
        })) {
            Button("OK") {
                
            }
        }
//        .alert(errorTitle ?? "Error", isPresented: $showError) {
//            Button("OK") {
//                
//            }
//        }
    }
}

struct ChildView: View {
    
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .onAppear {
                //title = "new title"
            }
    }
}

struct ChildView2: View {
    
    let title: String
    let setTitle: (String) -> ()
    
    var body: some View {
        Text(title)
            .onAppear {
                //setTitle("new title 2")
            }
    }
}

struct ChildView3: View {
    
    let title: Binding<String>
    
    var body: some View {
        Text(title.wrappedValue)
            .onAppear {
                title.wrappedValue = "new title 3"
            }
    }
}

#Preview {
    CustomBindingBootcamp()
}
