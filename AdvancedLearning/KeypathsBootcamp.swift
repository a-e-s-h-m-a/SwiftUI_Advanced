//
//  KeypathsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-04.
//

import SwiftUI

struct MyDataModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let count: Int
    let date: Date
}

struct MovieTitle {
    let primary: String
    let secondary: String
}

//extension Array where Element == MyDataModel {
//    func customSorted<T: Comparable>(keyPath: KeyPath<MyDataModel, T>) -> [MyDataModel] {
//        self.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
//    }
//}

extension Array {
    mutating func sortByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) {
        self.sort {
            ascending
            ? $0[keyPath: keyPath] < $1[keyPath: keyPath]
            : $0[keyPath: keyPath] > $1[keyPath: keyPath]
        }
    }
    
    func sortedByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self.sorted { 
            ascending
            ? $0[keyPath: keyPath] < $1[keyPath: keyPath]
            : $0[keyPath: keyPath] > $1[keyPath: keyPath]
        }
    }
}

struct KeypathsBootcamp: View {
    
   //@Environment(\.dismiss) var dismiss
//    @State private var screenTitle: String = ""
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        VStack {
            ForEach(dataArray) { item in
                VStack {
                    Text(item.id)
                    Text(item.title)
                    Text("\(item.count)")
                    Text(item.date.description)
                }
            }
        }
            .onAppear {
                var array = [
                    MyDataModel(title: "Three", count: 3, date: .distantFuture),
                    MyDataModel(title: "One", count: 1, date: .now),
                    MyDataModel(title: "Two", count: 2, date: .distantPast)
                ]
                
                //let newArray = array.sorted { $0.count < $1.count }
                
                
                
//                let newArray = array.sorted {
//                    $0[keyPath: \.count] < $1[keyPath: \.count]
//                }
                
//                let newArray = array.customSorted(keyPath: \.count)
//                let newArray = array.sortedByKeyPath(\.count, ascending: false)
                
                array.sortByKeyPath(\.count, ascending: false)
                
//                let item = MyDataModel(title: "One", count: 1, date: .now)
                
//                let title = item.title
                //let title2 = item[keyPath: \.title.primary]
//                let title2 = item[keyPath: \.title]
                
                dataArray = array
            }
    }
}

#Preview {
    KeypathsBootcamp()
}
