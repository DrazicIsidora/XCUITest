//
//  MainTest.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/26/22.
//

import Foundation

class MainTest : BaseTest {
    
    let mainPage = MainPage()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mainPage.loginIntoApp()
    }
    
    func testSwipeToLastItem() {
        mainPage.swipeToElement(element: mainPage.getLastElementInTheTable())
        mainPage.assertLastElementIsVisible()
    }
    
    func testIfListItemContainsEmail() {
        sleep(2)
        mainPage.assertUserListContainsEmail()
    }
    
    func testCheckRedirectionForFirstItem(){
        mainPage.tapOnFirstItem()
        mainPage.assertBackNavigationButton()
    }
    
    func testUserLogout() {
        mainPage.logout()
        mainPage.assertUserIsLoggedOut()
    }
}
    

