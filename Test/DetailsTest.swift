//
//  DetailsTest.swift
//  Code9-Mobile-2022-iOSUITests
//
//  Created by Isidora Drazic on 5/27/22.
//

import Foundation
import XCTest

class DetaiTest : BaseTest {
    
    let detailPage = DetailPage()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    func testUserDetailsImage(){
        detailPage.navigateToDetailPage(index:0)
        detailPage.assertDetailImageIsVisible()
    }
    
    func testUserDetailUsername(){
        detailPage.navigateToDetailPage(index:0)
        detailPage.assertDetailUsernameIsVisible()
    }
    
    func testUserDetailBackbutton(){
        detailPage.navigateToDetailPage(index:0)
        detailPage.assertDetailBackButtonIsVisible()
    }
    
    func testUsernameIsMatched(){
        detailPage.assertUsernameIsMatched()
    }
}
