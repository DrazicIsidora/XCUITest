//
//  ExampleTest.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/27/22.
//
import XCTest

class ExampleTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        let usernametextfieldidentifierTextField = app/*@START_MENU_TOKEN@*/.textFields["userNameTextFieldIdentifier"]/*[[".scrollViews",".textFields[\"Type your Username.\"]",".textFields[\"userNameTextFieldIdentifier\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        usernametextfieldidentifierTextField.tap()
        usernametextfieldidentifierTextField.typeText("1")
        
        let passwordtextfieldidentifierSecureTextField = app/*@START_MENU_TOKEN@*/.secureTextFields["passwordTextFieldIdentifier"]/*[[".scrollViews",".secureTextFields[\"Type your Password.\"]",".secureTextFields[\"passwordTextFieldIdentifier\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        passwordtextfieldidentifierSecureTextField.tap()
        passwordtextfieldidentifierSecureTextField.typeText("2")

        app.scrollViews.containing(.image,identifier:"logoIdentifier").element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["loginButtonIdentifier"]/*[[".scrollViews",".buttons[\"Login\"]",".buttons[\"loginButtonIdentifier\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Login"].tap()
        
        
        XCTAssertTrue(app.alerts["Wrong Username"].exists, "User is logged in")
    }
}
