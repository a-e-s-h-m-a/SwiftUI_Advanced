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
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init () {
        publishFakeData()
    }
    
    private func publishFakeData() {
        let items: [Int] = [1,2,3,4,5,6,7,8,9,10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                //self.currentValuePublisher.send(items[x])
                //self.basicPublisher = items[x]
                
                if x > 4 && x < 8 {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
    }
}

class AdvancedCombineBootcampViewModel: ObservableObject {
    
    @Published var data: [String] = []
    @Published var bools: [Bool] = []
    @Published var error: String = ""
    let dataService = AdvancedCombineDataService()
    
    let multicastPublisher = PassthroughSubject<Int, Error>()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        //dataService.passThroughPublisher
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
            /*
            //.map { String($0) }
            //.tryMap({ x in
            //    if x == 5 {
            //        throw URLError(.badServerResponse)
            //    }
            //    return String(x)
            //})
            //.compactMap({ x in
            //    if x == 5 {
            //        return nil // ignore the value
            //    }
            //    return String(x)
            //})
            //.tryCompactMap()
            //.filter { $0 > 3 && $0 < 7 }
            //.tryFilter()
            //.removeDuplicates()
            //.removeDuplicates(by: { x, y in
            //    return x == y
            //})
            //.replaceNil(with: 0)
            //.replaceEmpty(with: [])
            //.replaceError(with: "Default")
            //.scan(0, { existingValue, newValue in
            //    return existingValue + newValue
            //})
            //.scan(0, { $0 + $1 })
            //.scan(0, +)
            //.tryScan(,)
            //.reduce(0, { $0 + $1 }) // published at last to a one final value
            //.reduce(0, +)
            //.collect() collect all -> publish all at once
            //.collect(3)
            //.allSatisfy({ $0 == 5 })
            //.tryAllSatisfy()
             */
        
            // Timing operator
            /*
            //.debounce(for: 1, scheduler: DispatchQueue.main)
            //.delay(for: 2, scheduler: DispatchQueue.main)
            //
            //.measureInterval(using: DispatchQueue.main)
            //.map({ stride in
            //    return "\(stride.timeInterval)"
            //})
            //
            //.throttle(for: 3, scheduler: DispatchQueue.main, latest: true)
            //.retry(3)
            //.timeout(0.75, scheduler: DispatchQueue.main)
             */
        
            // Multi Publisher / Subscribers
            /*
            //--------------------
            //.combineLatest(dataService.boolPublisher)
            //.compactMap({ (int, bool) in
            //    if bool {
            //        return int
            //    } else {
            //        return nil
            //    }
            //})
            //.removeDuplicates()
            //---------------------
            //.combineLatest(dataService.boolPublisher, dataService.intPublisher)
            //.compactMap({ (int1, bool, int2) in
            //    if bool {
            //        return int1
            //    }
            //    return -1
            //})
            //---------------------
            //.merge(with: dataService.intPublisher)
            //---------------------
            //.zip(dataService.boolPublisher, dataService.intPublisher)
            //.map({ tupple in
            //    return String(tupple.0) + tupple.1.description + String(tupple.2)
            //})
            //---------------------
            //.tryMap({ _ in
            //    throw URLError(.badServerResponse)
            //})
            //.catch({ error in
            //    return self.dataService.intPublisher
            //})
            //---------------------
             */
        
        let sharedPublisher = dataService.passThroughPublisher
            //.dropFirst(3)
            .share() // sharing
            //.multicast { // ????
            //    PassthroughSubject<Int, Error>()
            //}
            .multicast(subject: multicastPublisher)
        
        sharedPublisher
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
        
        sharedPublisher
            .map { $0 > 5 ? true : false }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = "error: \(error)"
                }
            } receiveValue: { [weak self] returnedValue in
                self?.bools.append(returnedValue)
            }
            .store(in: &cancellables)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sharedPublisher
                .connect()
                .store(in: &self.cancellables)
        }
    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
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
                VStack {
                    ForEach(vm.bools, id: \.self) {
                        Text($0.description)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
