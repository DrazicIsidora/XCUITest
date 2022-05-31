//
//  LoginPage.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/24/22.
//

import Foundation
import XCTest

class LoginPage: BasePage {
    

    // Locate UserName error popup
    private func getWrongUsernameAlert() -> XCUIElement {
        return getApp().alerts[Constants.TF_WARNING_USERNAME_POPUP_ID]
    }
    
    // Locate Password error popup
    private func getWrongPasswordAlert() -> XCUIElement {
        return getApp().alerts[Constants.TF_WARNING_PASSWORD_POPUP_ID]
    }
    
    // Locate Master title
    private func getMainTitle() -> XCUIElement {
        return  getApp().navigationBars[Constants.MAIN_TITLE_ID]
    }
    
    // Assert that Username error popup is dispalyed
    func assertInvalidUsername(){
        XCTAssert(getWrongUsernameAlert().exists)
    }
    
    // Assert that Password error popup is dispalyed
    func assertInvalidPassword(){
        XCTAssert(getWrongPasswordAlert().exists)
    }
    
    // Assert that Master title is displayed
    func assertMainScreenTitle(){
        XCTAssert(getMainTitle().exists)
    }
}
