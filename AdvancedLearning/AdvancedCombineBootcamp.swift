//
//  AdvancedCombineBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-02-26.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
    //@Published var basicPublisher: String = "first publish"
    let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<String, Error>() // does not hold current value (bit memory efficient)
    
    init () {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items = ["one", "two", "three"]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                //self.currentValuePublisher.send(items[x])
                //self.basicPublisher = items[x]
            }
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
        dataService.passThroughPublisher
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
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
