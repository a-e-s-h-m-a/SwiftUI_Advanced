//
//  UnitTestingBootcampVM.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-26.
//

import Foundation
import SwiftUI

class UnitTestingBootcampVM: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
    
    func addIten(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
}
