//
//  AnimatableDataBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-11.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: animate ? 60 : 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AnimatableDataBootcamp()
}
