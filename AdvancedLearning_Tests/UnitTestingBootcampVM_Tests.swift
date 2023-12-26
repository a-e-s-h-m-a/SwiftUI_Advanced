//
//  UnitTestingBootcampVM_Tests.swift
//  AdvancedLearning_Tests
//
//  Created by Malith Madhushanka on 2023-12-26.
//

import XCTest
@testable import AdvancedLearning

// Naming structure: test_UnitOfWork_StateUnderTest_expectedBehaviour
// Naming structure: test_[struct or class]_[variable or func]_[expected result]

// Testing structute: given when then

final class UnitTestingBootcampVM_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

}
