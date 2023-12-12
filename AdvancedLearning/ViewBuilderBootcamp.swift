//
//  ViewBuilderBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-12.
//

import SwiftUI

struct HeaderViewRegular: View {
    
    let title: String
    let description: String?
    let iconName: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            if let description = description {
                Text(description)
                    .font(.callout)
            }
            
            if let iconName = iconName {
                Image(systemName: iconName)
            }

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct HeaderViewGeneric<T: View>: View {
    let title: String
    let content: T
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            content

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct ViewBuilderBootcamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: "desc", iconName: "heart.fill")
            
            HeaderViewGeneric(title: "Generic title 1", content: Text("hello"))
            
            HeaderViewGeneric(title: "Generic title 2", content: Image(systemName: "heart.fill"))
            
            HeaderViewGeneric(title: "Generic title 3", content: HStack {
                Text("hellooo")
                Image(systemName: "bolt.fill")
            })
            
            Spacer()
        }
    }
}

#Preview {
    ViewBuilderBootcamp()
}
