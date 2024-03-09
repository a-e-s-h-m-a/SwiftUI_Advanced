//
//  CustomOperatorBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-09.
//

import SwiftUI

struct CustomOperatorBootcamp: View {
    
    @State private var value: Double = 0
    
    var body: some View {
        Text("\(value)")
            .onAppear {
                //value = 5 + 5
                //value = 6 +/ 2
                //value = 6 ++/ 2
                let someValue: Int = 5
                
                value = someValue => Double.self
            }
    }
}

infix operator +/
infix operator ++/
infix operator =>

extension FloatingPoint {
    static func +/ (lhs: Self, rhs: Self) -> Self {
        (lhs + rhs) / 2
    }
    
    static func ++/ (lhs: Self, rhs: Self) -> Self {
        (lhs + lhs) / rhs
    }
}

protocol InitFromBinaryInteger {
    init<Source>(_ value: Source) where Source : BinaryInteger
}

extension Double: InitFromBinaryInteger {
    
}


extension BinaryInteger {
    static func => <T: InitFromBinaryInteger>(value: Self, newType: T.Type) -> T {
        T(value)
    }
}

#Preview {
    CustomOperatorBootcamp()
}
