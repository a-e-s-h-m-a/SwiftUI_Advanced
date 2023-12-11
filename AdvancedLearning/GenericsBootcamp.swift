//
//  GenericsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-11.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello world")
    
    func removeData() {
        stringModel = stringModel.removeInfo()
    }
}

struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.stringModel.info ?? "no data")
                .onTapGesture {
                    vm.removeData()
                }
        }
    }
}

#Preview {
    GenericsBootcamp()
}
