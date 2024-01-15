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
        signUpAndsignIn(shouldTypeOnKeyboard: false)
        
        let navBar = app.navigationBars["Welcome!"]
        // then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        // given
        signUpAndsignIn(shouldTypeOnKeyboard: true)
        
        let navBar = app.navigationBars["Welcome!"]
        // then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
        // given
        signUpAndsignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapAlertButton(shouldDismiss: false)
        
        //then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
    
    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDissmissAlert() {
        // given
        signUpAndsignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapAlertButton(shouldDismiss: true)
        
        // then
        let isAlertExists = app.alerts.firstMatch.waitForExistence(timeout: 3)
        XCTAssertFalse(isAlertExists)
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // given
        signUpAndsignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapNavLink(shouldDismissDestination: false)
        
        // then
        let destinationText = app.staticTexts["Destination"]
        XCTAssertTrue(destinationText.exists)
    }
    
    func tapNavLink(shouldDismissDestination: Bool) {
        let navLinkButton =  app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        if shouldDismissDestination {
            let backButton = app.navigationBars.buttons["Welcome!"]
            backButton.tap()
        }
    }
    
    func test_SignedInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // given
        signUpAndsignIn(shouldTypeOnKeyboard: true)
        
        // when
        tapNavLink(shouldDismissDestination: true)

        // then
        let navBar = app.navigationBars["Welcome!"]
        XCTAssertTrue(navBar.exists)
    }
}

//MARK: functions

extension UITestingBootcamp_UITests {
    func signUpAndsignIn(shouldTypeOnKeyboard: Bool) {
        let textField = app.textFields["SignUpTextField"]
        
        // when
        textField.tap()
        
        if shouldTypeOnKeyboard {
            let keyA = app.keys["A"]
            keyA.tap()
            let keya = app.keys["a"]
            keya.tap()
            keya.tap()
        }
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let signedUpButton = app.buttons["SignUpButton"]
        signedUpButton.tap()
    }
    
    func tapAlertButton(shouldDismiss: Bool) {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismiss {
            let alert = app.alerts.firstMatch
            
            let alertOKButton = alert.buttons["OK"]
            let alertExists = alertOKButton.waitForExistence(timeout: 3)
            XCTAssertTrue(alertExists)
            
            alertOKButton.tap()
        }
    }
}
