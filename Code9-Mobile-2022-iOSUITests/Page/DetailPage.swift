//
//  DetailPage.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/27/22.
//

import Foundation
import XCTest

class DetailPage : BasePage {
    
    // Locate Username on Detail screen
    private func getDetailUsername() -> XCUIElement {
        return getApp().staticTexts[Constants.LB_USERNAME_ID]
    }
    
    // Locate User image on Detail screen
    private func getDetailImage() -> XCUIElement {
        return getApp().images[Constants.IW_USER_IMAGE_ID]
    }
    
    // Locate Back navigation button on Detail screen
    private func getDetailBackButton() -> XCUIElement {
        return getApp().buttons[Constants.BTN_BACK_NAVIGATION_BUTTON_ID]
    }
    
    // Get Username value from the list on Main screen
    func getUsernameFromUserList(index:Int) -> XCUIElement {
        return getApp().tables.cells.element(boundBy: index)
    }
    
    // Tap on some item in the list
    func tapOnItemInList(index:Int){
        sleep(2)
        getApp().tables.cells.element(boundBy: index).tap()
    }
    
    // Get Username value from the Detail screen
    func getUsernameValueFromDetails() -> XCUIElement {
        return getDetailUsername()
    }
    
    // Assert that Username is visible on Detail screen
    func assertDetailUsernameIsVisible() {
        XCTAssert(getDetailUsername().exists)
    }
    
    // Assert that User image is visible on Detail screen
    func assertDetailImageIsVisible() {
        XCTAssert(getDetailImage().exists)
    }
    
    // Assert that Back navigation button is visible on Detail screen
    func assertDetailBackButtonIsVisible() {
        XCTAssert(getDetailBackButton().exists)
    }
    
    // Assert that Username from item on Main screen is matched with Username on Detail screen
    func assertUsernameIsMatched() {
        loginIntoApp()
        let usernameId = getUsernameFromUserList(index: 1).identifier
        tapOnItemInList(index: 1)
        getUsernameValueFromDetails().waitForExistence(timeout: Constants.DEFAULT_WAIT_TIME)
        let usernameLabel = getUsernameValueFromDetails().label
        XCTAssert(usernameId.contains(usernameLabel))
    }
}
