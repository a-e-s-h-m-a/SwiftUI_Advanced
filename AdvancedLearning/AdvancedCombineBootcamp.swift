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
    // let currentValuePublisher = CurrentValueSubject<Int, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>() // does not hold current value (bit memory efficient)
    
    init () {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = Array(1..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                //self.currentValuePublisher.send(items[x])
                //self.basicPublisher = items[x]
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var error: String = ""
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.passThroughPublisher
            // Sequence operations
            /*//.first()
            //.first(where: { $0 > 4 })
            //.tryFirst(where: { x in
            //    if x == 3 {
            //        throw URLError(.badServerResponse)
            //    }
            //    return x > 1
            //})
            //.last()
            //.last(where: { $0 < 4 }) // 3 comes out when pipeline completes
            //.tryLast(where: { x in
            //    if x == 3 {
            //        throw URLError(.badServerResponse) // when error -> auto completes
            //    }
            //    return x > 1
            //})
            //.dropFirst()
            //.dropFirst(3) // drops first 3
            //.drop(while: { $0 < 5 })
            //.tryDrop(while: { x in
            //    if x == 5 {
            //        throw URLError(.badServerResponse) // when error -> auto completes
            //    }
            //    return x < 6
            //})
            //.prefix(4) // first 4
            //.prefix(while: { $0 < 5 })
            //.output(at: 1)
            //.output(in: 2..<4)
            */
        
            // Math operations
            /*
            //.max()
            //.max(by: { x1, x2 in
            //    x1 < x2
            //})
            //.tryMax(by: )
            //.min()
            //.min(by: )
            //.tryMin(by: )
             */
        
            // Filtering / Reducing operations
        
            .map { String($0) }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "error: \(error)"
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
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
