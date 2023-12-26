//
//  UnitTestingBootcampVM.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-26.
//

import Foundation
import SwiftUI
import Combine

class UnitTestingBootcampVM: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    let dataService: NewDataServiceProtocol
    
    
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        } else {
            selectedItem = nil
        }
    }
    
    func saveItem(item: String) throws {
        guard !item.isEmpty else {
            throw DataError.noData
        }
        
        if let x = dataArray.first(where: { $0 == item }) {
            print("save item here...\(x)")
        } else {
            throw DataError.itemNotFound
        }
    }
    
    func downloadWithEscaping() {
        dataService.downloadItemsWithEscaping { [weak self] items in
            self?.dataArray = items
        }
    }
    
    func downloadWithCombine() {
        dataService.downloadItemsWithCombine()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.dataArray = returnedItems
            }
            .store(in: &cancellables)

    }
}

enum DataError: LocalizedError {
    case noData
    case itemNotFound
}
