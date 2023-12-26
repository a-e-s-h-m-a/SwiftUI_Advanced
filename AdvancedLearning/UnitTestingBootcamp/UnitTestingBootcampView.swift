//
//  unitTestingBootcampView.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-26.
//

import SwiftUI

struct unitTestingBootcampView: View {
    
    @StateObject private var vm: UnitTestingBootcampVM
    
    init(isPremium: Bool) {
        self._vm = StateObject(wrappedValue: UnitTestingBootcampVM(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    unitTestingBootcampView(isPremium: true)
}
