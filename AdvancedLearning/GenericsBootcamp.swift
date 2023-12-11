//
//  GenericsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-11.
//

import SwiftUI

class GenericsViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        dataArray = ["one", "two", "three"]
    }
    
    func removeDataFromArray() {
        dataArray.removeAll()
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            ForEach(vm.dataArray, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        vm.removeDataFromArray()
                    }
            }
        }
    }
}

#Preview {
    GenericsBootcamp()
}
