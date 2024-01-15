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
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        // then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        
        sleep(1)
        
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        // then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        //then
        XCTAssertTrue(alert.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDissmissAlert() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        
        let alertOKButton = alert.buttons["OK"]
        let alertExists = alertOKButton.waitForExistence(timeout: 3)
        XCTAssertTrue(alertExists)
        
        alertOKButton.tap()
        
        let isAlertExists = alertOKButton.waitForExistence(timeout: 3)
        XCTAssertFalse(isAlertExists)
        // then
        XCTAssertFalse(alert.exists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
        
        let navLinkButton =  app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let destinationText = app.staticTexts["Destination"]
        
        // then
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // given
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        let keyA = app.keys["A"]
        keyA.tap()
        let keya = app.keys["a"]
        keya.tap()
        keya.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
        
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
        
        let navLinkButton =  app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
        
        let backButton = app.navigationBars.buttons["Welcome!"]
        backButton.tap()

        // then
        XCTAssertTrue(navBar.exists)
    }
}
