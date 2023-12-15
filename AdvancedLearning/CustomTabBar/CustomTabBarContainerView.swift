//
//  CustomTabBarContainerView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

#Preview {
    let tabs: [TabBarItem] = [.home, .favourites, .profile]
    
    return CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
    }
}
