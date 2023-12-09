//
//  AnyTransitionBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-09.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: 180), //active state
            identity: RotateViewModifier(rotation: 0) // non active state
        )
    }
    
    // with parameters
    static func rotating(rotation: Double) -> AnyTransition {
        modifier(
            active: RotateViewModifier(rotation: rotation), //active state
            identity: RotateViewModifier(rotation: 0) // non active state
        )
    }
    
    // asymmetric transition
    static var rotateOn: AnyTransition {
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .trailing)
        )
    }
}


struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
//                    .transition(.rotating(rotation: 1080))
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
            }
            
            Spacer()
            
            Text("Click me!")
                .withDefaultButtonFormatting()
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}
