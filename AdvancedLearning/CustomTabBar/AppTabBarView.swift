//
//  AppTabBarView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "Home"
    @State var tabSelection: TabBarItem = TabBarItem(iconName: "house", title: "Home", color: .red)
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.blue
                .tabBarItem(tab: TabBarItem(iconName: "house", title: "Home", color: .red), selection: $tabSelection)
            
            Color.red
                .tabBarItem(tab: TabBarItem(iconName: "heart", title: "Favourites", color: .blue), selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: TabBarItem(iconName: "person", title: "Profile", color: .green), selection: $tabSelection)
        }
//        defaultTabView
    }
}

#Preview {
    let tabs: [TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: .red),
        TabBarItem(iconName: "heart", title: "Favourites", color: .blue),
        TabBarItem(iconName: "person", title: "Profile", color: .green)
    ]
    
    return AppTabBarView()
}

extension AppTabBarView {
    private var defaultTabView: some View {
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
