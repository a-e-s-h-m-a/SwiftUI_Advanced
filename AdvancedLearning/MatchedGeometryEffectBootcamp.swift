//
//  MatchedGeometryEffectBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-10.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100, height: 100)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectBootcamp()
}
