//
//  UITestingBootcamp_UITests.swift
//  AdvancedLearning_UITests
//
//  Created by Malith Madhushanka on 2024-01-02.
//

import XCTest

// Naming structure: test_UnitOfWork_StateUnderTest_expectedBehaviour
// Naming structure: test_[struct]_[ui components]_[expected result]

// Testing structute: given when then

final class UITestingBootcamp_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // given
        let textField = app.textFields["Add your name..."]
        
        // when
        textField.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["Sign Up"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        // then
        XCTAssertTrue(navBar.exists)
    }
}
