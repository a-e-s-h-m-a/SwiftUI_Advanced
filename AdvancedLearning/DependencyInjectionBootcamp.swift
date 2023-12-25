//
//  DependencyInjectionBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-25.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ProductionDataServer {
    
    static let instance = ProductionDataServer()
    
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        loadPosts()
    }
    
    private func loadPosts() {
        ProductionDataServer.instance.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootcamp: View {
    
    @StateObject private var vm = DependencyInjectionViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

#Preview {
    DependencyInjectionBootcamp()
}
