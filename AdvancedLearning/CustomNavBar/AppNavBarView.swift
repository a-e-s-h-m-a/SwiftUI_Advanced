//
//  AppNavBarView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
//        defaultNavView
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                
                CustomNavLink(
                    destination: Text("destination")
                        .customNavigationTitle("second screen")
                        .customNavigationSubtitle("custom subtitle")
                    
                ) {
                    Text("Navigate")
                }
                .custonNavBarItems(title: "New title", subtitle: "subtitle", backButtonHidden: true)
                
//                NavigationLink {
//                    Text("destination")
//                } label: {
//                    Text("Navigate")
//                }
            }
        }
    }
}

extension AppNavBarView {
    private var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink {
                    Text("Destination")
                        .navigationTitle("Title 2")
                        .navigationBarBackButtonHidden(false)
                } label: {
                    Text("Navigation")
                }
            }
            .navigationTitle("Nav title here")
        }
    }
}

#Preview {
    AppNavBarView()
}
