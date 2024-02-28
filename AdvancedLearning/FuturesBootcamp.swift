//
//  FuturesBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-02-28.
//

import SwiftUI
import Combine

//download with combine
//download with @escaping closure
//convert @escaping closures to combine

class FuturesBootcampViewModel: ObservableObject {
    
    @Published var title: String = "Starting title"
    let url = URL(string: "https://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    func download() {
        // //combine
        //getCombinePublisher()
        //    .sink { _ in
        //
        //    } receiveValue: { [weak self] returnedValue in
        //        self?.title = returnedValue
        //    }
        //    .store(in: &cancellables)
        
        // //closure
        //getEscapingClosure { [weak self] returnedValue, error in
        //    self?.title = returnedValue
        //}
        
        // using Futures
        getFuturePublisher()
            .sink { _ in
        
            } receiveValue: { [weak self] returnedValue in
                self?.title = returnedValue
            }
            .store(in: &cancellables)

    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map { _ in "New Value"}
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("New Value 2", nil)
        }
        .resume()
    }
    
    func getFuturePublisher() -> Future<String, Error> {
        return Future { [weak self] promise in
            self?.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnedValue))
                }
            }
        }
    }
    
    // EXAMPLE
    func doSomething(completion: @escaping (_ value: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion("NEW STRING")
        }
    }
    
    func doSomethingFuture() -> Future<String, Never> {
        Future { [weak self] promise in
            self?.doSomething(completion: { value in
                promise(.success(value))
            })
        }
    }
}

struct FuturesBootcamp: View {
    
    @StateObject var vm = FuturesBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

#Preview {
    FuturesBootcamp()
}
