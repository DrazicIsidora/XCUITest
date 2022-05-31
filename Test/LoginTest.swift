//
//  LoginTest.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/24/22.
//

import Foundation

class LoginTest : BaseTest {
    
    let loginPage = LoginPage()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    func testUsernmeLength() {
        loginPage.setUserName(text: "Code9")
        loginPage.setPassword(text: "MobileTesting9!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidUsername()
    }
    
    func testInvalidCredentials() {
        loginPage.setUserName(text: "Code9")
        loginPage.setPassword(text: "Testing")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidUsername()
    }
    
    func testLoginWithoutUsername() {
        loginPage.setPassword(text: "MobileTesting9!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidUsername()
    }
    
    func testLoginWithoutPassword() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidPassword()
    }
    
    func testLoginWithEmptyLoginForm() {
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidUsername()
    }
    
    func testPasswordWithoutUpercase() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.setPassword(text: "mobiletesing9!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidPassword()
    }
    
    func testPasswordWithoutSpecialCharacters() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.setPassword(text: "MobileTesting9")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidPassword()
    }
    
    func testPasswordWithoutNumbers() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.setPassword(text: "MobileTesting!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidPassword()
    }
    
    func testPasswordLength() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.setPassword(text: "Mobile9!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertInvalidPassword()
    }
    
    func testValidCredentials() {
        loginPage.setUserName(text: "Code9workshop")
        loginPage.setPassword(text: "MobileTesting9!")
        loginPage.clickOnLogo()
        loginPage.clickOnLoginButton()
        loginPage.assertMainScreenTitle()
    }
}
