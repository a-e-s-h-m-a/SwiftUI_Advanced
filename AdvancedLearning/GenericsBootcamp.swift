//
//  GenericsBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-11.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello world")
    @Published var genericModel = GenericModel(info: "hiii")
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericModel = genericModel.removeInfo()
    }
}

struct GenericView<T: View>: View {
    
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
            content
        }
    }
}


struct GenericsBootcamp: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("MEE"), title: "new value")
            Text(vm.stringModel.info ?? "no data")
            Text(vm.genericModel.info ?? "no data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

#Preview {
    GenericsBootcamp()
}
