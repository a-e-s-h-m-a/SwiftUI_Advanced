//
//  AdvancedCombineBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-02-26.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
    @Published var basicPublisher: [String] = []
    
    init () {
        publishFakeData()
    }
    
    private func publishFakeData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.basicPublisher = ["one", "two", "three"]
        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$basicPublisher
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data = returnedValue
            }
            .store(in: &cancellables)
    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
