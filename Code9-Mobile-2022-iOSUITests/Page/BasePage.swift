//
//  BasePage.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/24/22.
//

import XCTest

class BasePage {
    
    private let app = XCUIApplication()
    
    // Locate UserName input field
    private func getUserNameInputField() -> XCUIElement {
        return getApp().textFields[Constants.ET_USERNAME_ID]
    }
    
    // Locate Password input field
    private func getPasswordInputField() -> XCUIElement {
        return getApp().secureTextFields[Constants.ET_PASSWORD_ID]
    }
    
    // Locate Login button
    private func getLoginButton() -> XCUIElement {
        return getApp().buttons[Constants.BTN_LOGIN_ID]
    }
    
    // Locate Logo icon
    func getLogo() -> XCUIElement {
        return getApp().scrollViews.containing(.image,identifier:Constants.LOGO_ID).element
    }
    
    // Get app
    func getApp() -> XCUIApplication{
        return app
    }
    
    // Enter Username
    func setUserName(text: String){
        
        getUserNameInputField().tap()
        getUserNameInputField().typeText(text)
    }
    
    // Enter Password
    func setPassword(text : String){
        
        getPasswordInputField().tap()
        getPasswordInputField().typeText(text)
    }
    
    // Click on Login
    func clickOnLoginButton() {
        getLoginButton().tap()
    }
    
    // Click on Logo icon
    func clickOnLogo() {
        getLogo().tap()
    }
    
    // Valid login into the app
    func loginIntoApp() {
        setUserName(text: "Code9workshop")
        setPassword(text: "MobileTesting9!")
        clickOnLogo()
        clickOnLoginButton()
    }
    
    // Navigate to the Detail screen
    func navigateToDetailPage(index:Int){
        loginIntoApp()
        getApp().tables.cells.element(boundBy: index).tap()
    }
}
