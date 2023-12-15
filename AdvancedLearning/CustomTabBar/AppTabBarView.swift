//
//  AppTabBarView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    AppTabBarView()
}
