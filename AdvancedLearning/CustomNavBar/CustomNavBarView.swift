//
//  CustomNavBarView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @State var showBackButton: Bool = true
    @State var title: String = "Title" //""
    @State var subtitle: String? = "Subtitle"//nil
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton.opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button(
            action: {
                
            },
            label: {
                Image(systemName: "chevron.left")
            }
        )
    }
    
    private var titleSection: some View {
        VStack {
            Text("Title")
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}

#Preview {
    VStack {
        CustomNavBarView()
        Spacer()
    }
}
