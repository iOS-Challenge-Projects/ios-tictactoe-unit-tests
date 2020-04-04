//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by FGT MAC on 4/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    private var app:  XCUIApplication {
        return  XCUIApplication()
    }

    func testWinCheckingVertical1()  {
        app.launch()
        app.buttons["button0"].tap()
        
        
    }
}
