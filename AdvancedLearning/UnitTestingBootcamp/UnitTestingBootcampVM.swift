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
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}
