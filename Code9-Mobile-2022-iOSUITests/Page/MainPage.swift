//
//  MainPage.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/26/22.
//

import Foundation
import XCTest

class MainPage : BasePage {
    
    // Locate Logout button
    private func getLogoutButton() -> XCUIElement {
        return getApp().buttons[Constants.BTN_LOGOUT_ID]
    }
    
    // Locate Back navigation button
    func getBackNavigationButton() -> XCUIElement {
        return getApp().buttons[Constants.BTN_BACK_NAVIGATION_BUTTON_ID]
    }
    
    // Swipe to the specific element on the screen
    func swipeToElement(element: XCUIElement) {
        if(!element.isHittable) {
            getLastVisibleElement().swipeUp()
        }
    }
    
    // Count table size
    func getCellsCount() -> Int {
        return getApp().tables.cells.allElementsBoundByIndex.count
    }
    
    // Get last hittable element in the list
    func getLastVisibleElement() -> XCUIElement {
        return getApp().tables.cells.allElementsBoundByIndex.filter { $0.isHittable }.last!
    }
    
    // Get last element in the list
    func getLastElementInTheTable() -> XCUIElement {
        return getApp().tables.cells.element(boundBy: getCellsCount()-1)
    }
    
    // Get details of all elements in the list
    func getUserListDetail() -> String {
        return getApp().tables.cells.allElementsBoundByAccessibilityElement.description
    }
    
    // Click on first item in the list
    func tapOnFirstItem(){
        sleep(2)
        getApp().tables.cells.element(boundBy: 0).tap()
    }
    
    // Logout
    func logout(){
        getLogoutButton().tap()
    }
    
    // Assert that last element in the list is visible
    func assertLastElementIsVisible(){
        XCTAssertTrue(getLastVisibleElement().identifier.contains(String(getCellsCount()-1)))
    }
    
    // Assert that all items in user list contain email
    func assertUserListContainsEmail(){
        XCTAssert(getUserListDetail().contains("@"))
    }
    
    // Assert that user is logged out
    func assertUserIsLoggedOut() {
        XCTAssert(getLogo().exists)
    }
    
    // Assert that back button is located on the screen
    func assertBackNavigationButton() {
        XCTAssert(getBackNavigationButton().exists)
    }
}
