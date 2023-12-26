//
//  UnitTestingBootcampVM_Tests.swift
//  AdvancedLearning_Tests
//
//  Created by Malith Madhushanka on 2023-12-26.
//

import XCTest
@testable import AdvancedLearning
import Combine

// Naming structure: test_UnitOfWork_StateUnderTest_expectedBehaviour
// Naming structure: test_[struct or class]_[variable or func]_[expected result]

// Testing structute: given when then

final class UnitTestingBootcampVM_Tests: XCTestCase {
    
    var viewModel: UnitTestingBootcampVM?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = UnitTestingBootcampVM(isPremium: Bool.random())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        cancellables.removeAll()
    }

    func test_UnitTestingBootcampVM_isPremium_shouldBeTrue() {
        // given
        let userIsPremium: Bool = true
        
        // when
        let vm = UnitTestingBootcampVM(isPremium: userIsPremium)
        
        // then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingBootcampVM_isPremium_shouldBeFalse() {
        // given
        let userIsPremium: Bool = false
        
        // when
        let vm = UnitTestingBootcampVM(isPremium: userIsPremium)
        
        // then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootcampVM_isPremium_shouldBeInjectedValue() {
        // given
        let userIsPremium: Bool = Bool.random()
        
        // when
        let vm = UnitTestingBootcampVM(isPremium: userIsPremium)
        
        // then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingBootcampVM_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
            // given
            let userIsPremium: Bool = Bool.random()
            
            // when
            let vm = UnitTestingBootcampVM(isPremium: userIsPremium)
            
            // then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootcampVM_dataArray_shouldBeEmpty() {
        // given
        
        // when
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampVM_dataArray_shouldAddItem() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let loopCount = Int.random(in: 1..<10)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampVM_dataArray_shouldNotAddBlankString() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        vm.addItem(item: "")
        
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampVM_dataArray_shouldNotAddBlankString2() {
        // given
        guard let vm = viewModel  else {
            XCTFail()
            return
        }
        
        // when
        vm.addItem(item: "")
        
        // then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampVM_selectedItem_shouldStartAsNil() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        vm.addItem(item: "")
        
        // then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampVM_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        // select valid item
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        // select invalid item
        vm.selectItem(item: UUID().uuidString)
        
        // then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampVM_selectedItem_shouldBeSelected() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // then
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_UnitTestingBootcampVM_selectedItem_shouldBeSelected_stress() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let loopCount = Int.random(in: 1..<10)
        var itemArray: [String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemArray.append(newItem)
        }
        
        let randomItem = itemArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        vm.selectItem(item: randomItem)
        
        // then
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestingBootcampVM_saveItem_shouldThrowError_itemNotFound() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let loopCount = Int.random(in: 1..<10)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // then
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "should throw item not found error") { error in
            let returnedError = error as? DataError
            XCTAssertEqual(returnedError, DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingBootcampVM_saveItem_shouldThrowError_noData() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let loopCount = Int.random(in: 1..<10)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // then
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? DataError
            XCTAssertEqual(returnedError, DataError.noData)
        }
    }
    
    func test_UnitTestingBootcampVM_saveItem_shouldSaveItem() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let loopCount = Int.random(in: 1..<10)
        var itemArray: [String] = []
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemArray.append(newItem)
        }
        
        let randomItem = itemArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        // then
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            XCTFail()
        }
    }
    
    func test_UnitTestingBootcampVM_downloadWithEscaping_shouldReturnItems() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let expectation = XCTestExpectation(description: "should return items after 3 sec")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithEscaping()
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampVM_downloadWithCombine_shouldReturnItems() {
        // given
        let vm = UnitTestingBootcampVM(isPremium: Bool.random())
        
        // when
        let expectation = XCTestExpectation(description: "should return items a sec")
        
        vm.$dataArray
            .dropFirst()
            .sink { returnedItems in
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        vm.downloadWithCombine()
        // then
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }

}
