//
//  SubscriptBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-08.
//

import SwiftUI

//extension Array {
//    func getItem(atIndex: Int) -> Element? {
//        for (index, element) in self.enumerated() {
//            if index == atIndex {
//                return element
//            }
//        }
//        return nil
//    }
//    
//    subscript(atIndex: Int) -> Element? {
//        for (index, element) in self.enumerated() {
//            if index == atIndex {
//                return element
//            }
//        }
//        return nil
//    }
//}

extension Array where Element == String {
    subscript(value: String) -> Element? {
        self.first(where: { $0 == value })
    }
}

struct Customer {
    let name: String
    let address: String
    
    subscript(value: String) -> String? {
        switch value {
        case "name":
            return name
        case "address":
            return address
        default:
            return nil
        }
    }
}

struct SubscriptBootcamp: View {
    
    @State private var myArray: [String] = ["one", "two", "three"]
    @State private var selectedItem: String? = nil
    
    var body: some View {
        VStack {
            ForEach(myArray, id: \.self) { str in
                Text("\(str)")
            }
            
            Text("SELECTED: \(selectedItem ?? "none")")
        }
        .onAppear {
            //selectedItem = myArray[0]
            //selectedItem = myArray.getItem(atIndex: 0)
            
            let value = "three"
            //selectedItem = myArray.first(where: { $0 == value })
            selectedItem = myArray[value]
            
            let customer = Customer(name: "Nick", address: "Main street")
            //selectedItem = customer.name
            //selectedItem = customer[keyPath: \.name]
            selectedItem = customer["name"]
        }
    }
}

#Preview {
    SubscriptBootcamp()
}
