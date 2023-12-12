//
//  ScrollViewOffsetPreferenceBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-12.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                }
            )
            .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
                action(value)
            })
    }
}

struct ScrollViewOffsetPreferenceBootcamp: View {
    
    let title: String = "New title here..."
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75.0)
                    .onScrollOffsetChanged { value in
                        scrollViewOffset = value
                    }
                    
                
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        .overlay(
            navbarLayer.opacity(scrollViewOffset < 40 ? 1.0 : 0.0),
            alignment: .top
        )
    }
}

#Preview {
    ScrollViewOffsetPreferenceBootcamp()
}

extension ScrollViewOffsetPreferenceBootcamp {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navbarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.blue)
    }
}
