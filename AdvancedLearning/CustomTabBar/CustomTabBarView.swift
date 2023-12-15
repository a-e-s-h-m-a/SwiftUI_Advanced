//
//  CustomTabBarView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    var body: some View {
        tabBarV2
            .onChange(of: selection, { _, newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            })
    }
}

#Preview {
    let tabs: [TabBarItem] = [.home, .favourites, .profile]
    
    return VStack {
        Spacer()
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
    }
}

extension CustomTabBarView {
    private func tabview(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : .clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
    
    private var tabBarV1: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabview(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.white)
    }
}

extension CustomTabBarView {
    private func tabview2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarV2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabview2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}
