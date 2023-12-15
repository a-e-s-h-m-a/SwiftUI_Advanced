//
//  CustomNavView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-15.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    CustomNavView {
        Color.red.ignoresSafeArea()
    }
}

// to re-enable swiping navigation gestures
extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
